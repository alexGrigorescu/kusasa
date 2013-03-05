<?php

class PageController extends Core_MainController {

    public function indexAction(){

    }

    public function viewAction(){
        $pageId = $this->_getParam('page_id');
        $pagesModel = new Admin_Model_Pages($pageId);
        $this->view->title = $pagesModel->title;
        $this->view->content = $pagesModel->content;
    }

}

