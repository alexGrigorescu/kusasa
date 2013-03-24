<?php

class ProjectController extends Core_MainController {

    public function indexAction(){

    }

    public function viewAction(){
        $projectId = $this->_getParam('project_id');
        $projectModel = new Admin_Model_Project($projectId);
        $this->view->project = $projectModel->_toArray($projectModel->getAttributes());
        $this->view->title = $projectModel->title;

        $latestProjects = $projectModel->getLatest();
        $this->view->latestProjects = $latestProjects;

        $this->view->projectID = $projectId;
        $actionId = $this->_getParam('action');
        $this->view->actionID = $actionId;
        $controllerId = $this->_getParam('controller');
        $this->view->controllerID = $controllerId;
    }

    public function listAction(){
        $projectModel = new Admin_Model_Project();

        $this->view->projects = $projectModel->getAll();

        $latestProjects = $projectModel->getLatest();
        $this->view->latestProjects = $latestProjects;

        $projectId = $this->_getParam('project_id');
        $this->view->projectID = $projectId;
        $this->view->action;
        $actionId = $this->_getParam('action');
        $this->view->actionID = $actionId;
        $controllerId = $this->_getParam('controller');
        $this->view->controllerID = $controllerId;
    }

    public function exclusiveAction(){
        $projectModel = new Admin_Model_Project();

        $latestProjects = $projectModel->getLatest();
        $this->view->latestProjects = $latestProjects;

        $exclusiveProjects = $projectModel->getExclusive();
        $this->view->exclusiveProjects = $exclusiveProjects;

        $projectId = $this->_getParam('project_id');
        $this->view->projectID = $projectId;
        $actionId = $this->_getParam('action');
        $this->view->actionID = $actionId;
        $controllerId = $this->_getParam('controller');
        $this->view->controllerID = $controllerId;
    }

}

