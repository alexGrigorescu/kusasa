    <?php

class Admin_PageCategoryController extends Core_MainController {

    public function indexAction(){
        $pageCategoryModel = new Admin_Model_PageCategory();
        $pageCategories = $pageCategoryModel->getAll();
        $this->view->countPageCategories = count($pageCategories);
        $this->view->pageCategories = $pageCategories;
    }

    public function addAction(){
        $form = $this->_getForm();
        $request = $this->getRequest();

        if ($request->isPost() && $form->isValid($request->getPost())) {
            $data = $form->getValues();
            $pageCategoryModel = new Admin_Model_PageCategory();
            $id = $pageCategoryModel->save($data);
            if($id > 0){
                return $this->_helper->redirector('index', 'pageCategory', 'admin');
            }
        }

        $this->view->form = $form;
    }

    public function editAction(){
        $categoryId = $this->_getParam('category_id');
        $pageCategoryModel = new Admin_Model_PageCategory($categoryId);

        $populateData = array(
            'category_id'   => $pageCategoryModel->id,
            'name'          => $pageCategoryModel->name,
        );

        $form = $this->_getForm($populateData);
        $request = $this->getRequest();

        if ($request->isPost() && $form->isValid($request->getPost())) {
            $data = $form->getValues();
            $data['id'] = $categoryId;

            $id = $pageCategoryModel->save($data);
            if($id > 0){
                return $this->_helper->redirector('index', 'pageCategory', 'admin');
            }
        }

        $this->view->form = $form;
    }


    protected function _getForm($data = array()){
        $form = new Admin_Form_PageCategory();

        if(empty($data)){
            $form->setAction('add');
            return $form;
        } else {
            $form->setAction(
                $this->getHelper('url')->url(
                    array('controller' => 'pageCategory', 'action' => 'edit', 'category_id' => $data['category_id'])
                )
            );

            $form->populate(array(
                 'category_name'   => $data['name'],
            ));
            return $form;
        }
    }

}

