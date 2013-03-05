    <?php

class Admin_ProjectCategoryController extends Core_MainController {

    public function indexAction(){
        $projectCategoryModel = new Admin_Model_ProjectCategory();
        $projectCategories = $projectCategoryModel->getAll();

        $this->view->countCategories = count($projectCategories);
        $this->view->categories = $projectCategories;
    }

    public function addAction(){
        $form = $this->_getForm();
        $request = $this->getRequest();

        if ($request->isPost() && $form->isValid($request->getPost())) {
            $data = $form->getValues();
            $projectCategoryModel = new Admin_Model_ProjectCategory();
            $id = $projectCategoryModel->save($data);
            if($id > 0){
                return $this->_helper->redirector('index', 'projectCategory', 'admin');
            }
        }

        $this->view->form = $form;
    }

    public function editAction(){
        $categoryId = $this->_getParam('category_id');
        $projectCategoryModel = new Admin_Model_ProjectCategory($categoryId);

        $populateData = array(
            'category_id'   => $projectCategoryModel->id,
            'name'          => $projectCategoryModel->name,
        );

        $form = $this->_getForm($populateData);
        $request = $this->getRequest();

        if ($request->isPost() && $form->isValid($request->getPost())) {
            $data = $form->getValues();
            $data['id'] = $categoryId;

            $id = $projectCategoryModel->save($data);
            if($id > 0){
                return $this->_helper->redirector('index', 'projectCategory', 'admin');
            }
        }

        $this->view->form = $form;
    }


    protected function _getForm($data = array()){
        $form = new Admin_Form_ProjectCategory();

        if(empty($data)){
            $form->setAction('add');
            return $form;
        } else {
            $form->setAction(
                $this->getHelper('url')->url(
                    array('controller' => 'projectCategory', 'action' => 'edit', 'category_id' => $data['category_id'])
                )
            );

            $form->populate(array(
                 'category_name'   => $data['name'],
            ));
            return $form;
        }
    }

}

