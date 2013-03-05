<?php

class Admin_Form_Pages extends Zend_Form
{

    public function init()
    {    	
    	// Set the method for the display form to POST
        $this->setMethod('post');

        $this->addElement('text', 'page_title', array(
            'required'   => true,
            'allowEmpty' => false,
        ));

        $this->addElement('textarea', 'page_content', array(
            'required'   => true,
            'class'		 =>  "ckeditor",
        ));

        $this->addElement('select', 'category_id', array(
           'required'   => false,
        ));

		foreach($this->getElements() as $element) {
			$element->removeDecorator('Label');
		}
		$this->setElementFilters(array('StringTrim'));
    }
}
