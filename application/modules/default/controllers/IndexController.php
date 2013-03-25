<?php

class IndexController extends Core_MainController {

    public function indexAction(){
        $projectModel = new Admin_Model_Project();
        $latestProjects = $projectModel->getLatest();
        $this->view->latestProjects = $latestProjects;

        $exclusiveProjects = $projectModel->getExclusive();
        $this->view->exclusiveProjects = $exclusiveProjects;

        $pageId = $this->_getParam('page_id');
        $pagesModel = new Admin_Model_Pages($pageId);
        $services = $pagesModel->getServices();
        $this->view->services = $services;
    }

}

