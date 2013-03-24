<?php

class PageController extends Core_MainController {

    public function indexAction(){

    }

    public function viewAction(){
        $pageId = $this->_getParam('page_id');
        $pagesModel = new Admin_Model_Pages($pageId);
        $this->view->title = $pagesModel->title;
        $this->view->content = $pagesModel->content;

        $projectModel = new Admin_Model_Project();
        $latestProjects = $projectModel->getLatest();
        $this->view->latestProjects = $latestProjects;

        $this->view->pageID = $pageId;
        $this->view->categoryID = $pagesModel->category_id;
        $actionId = $this->_getParam('action');
        $this->view->actionID = $actionId;
        $controllerId = $this->_getParam('controller');
        $this->view->controllerID = $controllerId;

        $services = $pagesModel->getServices();
        $this->view->services = $services;
    }

}

