<?php

class Admin_Form_Project extends Zend_Form
{

    public function init()
    {    	
    	// Set the method for the display form to POST
        $this->setMethod('post');

        $this->addElement('text', 'project_title', array(
            'required'   => true,
            'allowEmpty' => false,
        ));

        $this->addElement('textarea', 'project_description', array(
            'required'   => true,
            'class'		 =>  "ckeditor",
        ));

        $this->addElement('textarea', 'gallery', array(
              'required'   => false,
              'hidden'     => true,
              'style'      => ' height: 100px;',
         ));

        $this->addElement('multiselect', 'category_id', array(
            'required'   => false,
        ));

		foreach($this->getElements() as $element) {
			$element->removeDecorator('Label');
		}
		$this->setElementFilters(array('StringTrim'));
    }
}
