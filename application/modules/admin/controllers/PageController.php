    <?php

class Admin_PageController extends Core_MainController {

    public function indexAction(){
        $pagesModel = new Admin_Model_Pages();
        $pages = $pagesModel->getAll();

        foreach($pages as $page){
            $page->content = $this->_helper->utils->getExcerpt(
                $page->content,
                300
            );
        }

        $this->view->countPages = count($pages);

        $this->view->pages = $pages;
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
            $pagesModel = new Admin_Model_Pages();
            $id = $pagesModel->save($data);
            if($id > 0){
                return $this->_helper->redirector('index', 'page', 'admin');
            }
        }

        $this->view->form = $form;
    }

    public function editAction(){

        $this->view->headScript()->offsetSetFile(
            100,
            $this->view->baseUrl().'/ckeditor/ckeditor.js'
        );

        $pageId = $this->_getParam('page_id');
        $pagesModel = new Admin_Model_Pages($pageId);

        $populateData = array(
            'page_id'       => $pagesModel->id,
            'title'         => $pagesModel->title,
            'category_id'   => $pagesModel->category_id,
            'content'       => $pagesModel->content
        );
        $form = $this->_getForm($populateData);
        $request = $this->getRequest();

        if ($request->isPost() && $form->isValid($request->getPost())) {
            $data = $form->getValues();
            $data['page_id'] = $pageId;

            $id = $pagesModel->save($data);
            if($id > 0){
                return $this->_helper->redirector('index', 'page', 'admin');
            }
        }

        $this->view->form = $form;
    }


    protected function _getForm($data = array()){
        $form = new Admin_Form_Pages();
        $form->getElement('category_id')->addMultiOptions($this->_getCategories());

        if(empty($data)){
            $form->setAction('add');
            return $form;
        } else {
            $form->setAction(
                $this->getHelper('url')->url(
                    array('controller' => 'page', 'action' => 'edit', 'page_id' => $data['page_id'])
                )
            );

            $form->populate(array(
                 'page_title'   => $data['title'],
                 'page_content' => $data['content'],
            ));
            $form->getElement('category_id')->setValue($data['category_id']);
            return $form;
        }
    }

    protected function _getCategories(){
        $pageCategoryModel = new Admin_Model_PageCategory();
        $result =  $pageCategoryModel->getAll();
        $categories = array(0 => '--- Select category ---');
        foreach($result as $category){
            $categories[$category['category_id']] = $category['name'];
        }
        return $categories;
    }
}

