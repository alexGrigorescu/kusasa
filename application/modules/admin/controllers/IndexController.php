<?php

class Admin_IndexController extends Core_MainController {

    public function init(){

    }

    public function indexAction(){

        if(Zend_Auth::getInstance()->hasIdentity()){
            $this->_forward('dashboard', 'index', 'admin');
        } else {
            $this->_forward('index', 'login', 'admin');
        }
    }

    public function dashboardAction(){

    }

}

