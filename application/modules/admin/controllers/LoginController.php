<?php

class Admin_LoginController extends Core_MainController {

    public function indexAction(){
        $this->view->form = new Admin_Form_Login();
    }

    public function processAction()
    {
        $request = $this->getRequest();

        // Check if we have a POST request
        if (!$request->isPost()) {

        }

        // Get our form and validate it
        $form = new Admin_Form_Login();

        // Invalid entries - re-render the login form
        if (!$form->isValid($request->getPost())) {
            return $this->_helper->redirector('index','login', 'admin');
        }

        // Get our authentication adapter and check credentials
        $objLogin = new Admin_Model_Login();
        $adapter = $objLogin->getAuthAdapter($form->getValues());
        $auth    = Zend_Auth::getInstance();
        $result  = $auth->authenticate($adapter);

        // Invalid credentials - re-render the login form
        if (!$result->isValid()) {
            return $this->_helper->redirector('index','login', 'admin');
        }

        $this->_helper->redirector('dashboard', 'index', 'admin');
    }

    public function logoutAction()
    {
        Zend_Auth::getInstance()->clearIdentity();
        unset($_SESSION);
        return $this->_helper->redirector('index','login', 'admin'); // back to login page
    }
}

