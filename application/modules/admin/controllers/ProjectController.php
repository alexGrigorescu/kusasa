    <?php

class Admin_ProjectController extends Core_MainController {

    public function indexAction(){
        $projectModel = new Admin_Model_Project();
        $projects = $projectModel->getAll();

        $this->view->countProjects = count($projects);
        $this->view->projects = $projects;
    }

    public function addAction(){

        $this->view->headScript()->offsetSetFile(
            100,
            $this->view->baseUrl().'/ckeditor/ckeditor.js'
        );
        $this->view->headScript()->offsetSetFile(
            101,
            $this->view->baseUrl().'/ckeditor/default_setup.js'
        );

        $form = $this->_getForm();
        $request = $this->getRequest();

        if ($request->isPost() && $form->isValid($request->getPost())) {
            $data = $form->getValues();
            $projectModel = new Admin_Model_Project();
            $id = $projectModel->save($data);

            if($id > 0){
                return $this->_helper->redirector('index', 'project', 'admin');
            }
        }

        $this->view->form = $form;
    }

    public function editAction(){
        $this->view->headScript()->offsetSetFile(
            100,
            $this->view->baseUrl().'/ckeditor/ckeditor.js'
        );
        $this->view->headScript()->offsetSetFile(
            101,
            $this->view->baseUrl().'/ckeditor/default_setup.js'
        );

        $projectId = $this->_getParam('project_id');
        $projectModel = new Admin_Model_Project($projectId);

        $populateData = array(
            'project_id'    => $projectModel->id,
            'title'         => $projectModel->title,
            'description'   => $projectModel->description,
            'gallery'       => $projectModel->gallery,
            'category_id'   => $projectModel->category_id
        );
        $form = $this->_getForm($populateData);
        $request = $this->getRequest();

        if ($request->isPost() && $form->isValid($request->getPost())) {
            $data = $form->getValues();
            $data['project_id'] = $projectId;

            $id = $projectModel->save($data);
            if($id > 0){
                return $this->_helper->redirector('index', 'project', 'admin');
            }
        }

        $this->view->form = $form;
    }


    protected function _getForm($data = array()){
        $form = new Admin_Form_Project();
        $form->getElement('category_id')->addMultiOptions($this->_getCategories());

        if(empty($data)){
            $form->setAction('add');
            return $form;
        } else {
            $form->setAction(
                $this->getHelper('url')->url(
                    array('controller' => 'project', 'action' => 'edit', 'project_id' => $data['project_id'])
                )
            );

            $form->populate(array(
                 'project_title'        => $data['title'],
                 'project_description'  => $data['description'],
                 'gallery'              => $data['gallery']
            ));

            $projectModel = new Admin_Model_Project();
            $form->getElement('category_id')->setValue($projectModel->mapBinaryToCategories($data['category_id']));
            return $form;
        }
    }

    protected function _getCategories(){
        $projectCategoryModel = new Admin_Model_ProjectCategory();
        $result =  $projectCategoryModel->getAll();
        foreach($result as $category){
            $categories[$category['category_id']] = $category['name'];
        }
        return $categories;
    }



}

