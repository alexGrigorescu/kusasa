<?php

class Admin_Form_Login extends Zend_Form
{

    public function init()
    {
        // Set the method for the display form to POST
        $this->setMethod('post');
        $this->setAction($this->getView()->url(array('module' => 'admin', 'controller'=>'login','action'=>'process')));

        // username
        $this->addElement('text', 'username', array(
           'required'   => true,
           'class'      => 'login-inp'
        ));

        // password
        $this->addElement('password', 'password', array(
           'required'   => true,
           'class'      => 'login-inp'
        ));

        foreach($this->getElements() as $element) {
            $element->removeDecorator('Label');
        }
        $this->setElementFilters(array('StringTrim'));
    }
}
