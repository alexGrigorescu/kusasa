<?php

class ProjectController extends Core_MainController {

    public function indexAction(){

    }

    public function viewAction(){
        $projectId = $this->_getParam('project_id');
        $projectModel = new Admin_Model_Project($projectId);
        $this->view->project = $projectModel->_toArray($projectModel->getAttributes());
    }

    public function listAction(){
        $projectModel = new Admin_Model_Project();

        $this->view->projects = $projectModel->getAll();

    }

}

