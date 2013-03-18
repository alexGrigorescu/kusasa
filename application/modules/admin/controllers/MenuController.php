<?php

class Admin_MenuController extends Core_MainController {

    public function indexAction(){
        $menuModel = new Admin_Model_Menu();
        $menu = $menuModel->getAll(true);

        $data['menu_ul'] = '<ul id="menu"></ul>';
        if ($menu) {

            $tree = $this->_helper->tree;

            foreach ($menu as $row) {
                $tree->add_row(
                    $row['id'],
                    $row['parent_id'],
                    ' id="menu-'.$row['id'].'" class="sortable"',
                    $this->_getLabel($row)
                );
            }

            $data['menu_ul'] = $tree->generate_list('id="menu"');
        }

        $this->view->menu = $data['menu_ul'];
    }

    /**
     * Save position
     */
    public function savePositionAction() {
        $this->_helper->viewRenderer->setNoRender();

        if (isset($_POST['menu'])) {
            $menu = $_POST['menu'];
            $this->_updatePosition(0, $menu);
        }
    }

    /**
     * Recursive function for save position
     */
    private function _updatePosition($parent, $children) {
        $i = 1;
        $menuModel = new Admin_Model_Menu();
        foreach ($children as $k => $v) {
            $id = (int)$children[$k]['id'];
            $data['parent_id'] = $parent;
            $data['position'] = $i;
            $data['id'] = $id;

            $menuModel->save($data);

            if (isset($children[$k]['children'][0])) {
                $this->_updatePosition($id, $children[$k]['children']);
            }
            $i++;
        }
    }

    /**
     * Add menu item action
     * For use with ajax
     * Return json data
     */
    public function addAction() {
        $this->_helper->viewRenderer->setNoRender();
        $response = array();
        if (!empty($_POST['title'])) {
            $menuModel = new Admin_Model_Menu();

            $data['title'] = trim($_POST['title']);
            $data['url'] = $_POST['url'];
            $data['class'] = $_POST['class'];
            $data['position'] = $menuModel->getLastPosition() + 1;

            $data['id'] = $menuModel->save($data);

            if ($data['id']) {
                $response['status'] = 1;
                $li_id = 'menu-'.$data['id'];
                $response['li'] = '<li id="'.$li_id.'" class="sortable">'.$this->_getLabel($data).'</li>';
                $response['li_id'] = $li_id;
                $response['msg'] = 'Menu item added successfully.';
            } else {
                $response['status'] = 2;
                $response['msg'] = 'Add menu error.';
            }
        }else {
            $response['status'] = 3;
        }

        header('Content-type: application/json');
        echo json_encode($response);
        exit;
    }

    /**
     * Save menu item
     * Action for edit menu item
     * return json data
     */
    public function editAction() {
        $this->_helper->viewRenderer->setNoRender();
        $itemId = intval($this->_getParam('menu_id'));
        $response = array();

        if (!empty($_POST['title']) && !empty($itemId)) {
            $data['title'] = trim($_POST['title']);
            $data['url'] = $_POST['url'];
            $data['class'] = $_POST['class'];
            $data['id'] = $itemId;

            $menuModel = new Admin_Model_Menu();
            try{
                $menuModel->save($data);
                $response['status'] = 1;
                $d['title'] = $data['title'];
                $d['url'] = $data['url'];
                $d['klass'] = $data['class']; //klass instead of class because of an error in js
                $response['menu'] = $d;
            } catch (Exception $e) {
                $response['status'] = 2;
                $response['msg'] = 'Edit menu item error. ' . $e->getMessage();
            }
        } else {
            $response['status'] = 3;
        }

        header('Content-type: application/json');
        echo json_encode($response);
        exit;
    }

    public function editFormAction(){
        $this->_helper->layout()->disableLayout();
        $id = intval($this->_getParam('id'));
        $menuModel = new Admin_Model_Menu($id);
        $this->view->menu = $menuModel;
    }

    /**
     * Delete menu item action
     * Also delete all sub items
     * return json data
     */
    public function deleteAction() {
        $this->_helper->viewRenderer->setNoRender();
        $response = array('success' => false);

        if (isset($_POST['id'])) {
            $id = (int)$_POST['id'];
            $menuModel = new Admin_Model_Menu();
            try{
                $menuModel->delete($id);
                $response['success'] = true;
            } catch (Exception $e){
                $response['success'] = false;
            }

        }
        header('Content-type: application/json');
        echo json_encode($response);
        exit;
    }

    /**
     * Get label for list item in menu manager
     * this is the content inside each <li>
     *
     * @param array $row
     * @return string
     */
    private function _getLabel($row) {
        $label =
            '<div class="ns-row">' .
                '<div class="ns-title">'.$row['title'].'</div>' .
                '<div class="ns-url">'.$row['url'].'</div>' .
                '<div class="ns-class">'.$row['class'].'</div>' .
                '<div class="ns-actions">' .
                    '<a href="#" class="edit-menu" title="Edit">' .
                        '<img src="/images/admin/ico_edit_16.png" alt="Edit">' .
                    '</a>' .
                    '<a href="#" class="delete-menu" title="Delete">' .
                        '<img src="/images/admin/cross.png" alt="Delete">' .
                    '</a>' .
                    '<input type="hidden" name="menu_id" value="'.$row['id'].'">' .
                '</div>' .
            '</div>';
        return $label;
    }



}

