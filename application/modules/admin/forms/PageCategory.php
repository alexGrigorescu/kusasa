<?php

class Admin_Form_PageCategory extends Zend_Form
{

    public function init()
    {    	
    	// Set the method for the display form to POST
        $this->setMethod('post');

        $this->addElement('text', 'category_name', array(
            'required'   => true,
            'allowEmpty' => false,
        ));

		foreach($this->getElements() as $element) {
			$element->removeDecorator('Label');
		}
		$this->setElementFilters(array('StringTrim'));
    }
}
