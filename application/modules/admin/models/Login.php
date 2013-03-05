<?php

class Admin_Model_Login extends Core_MainModel
{
	public function __construct()
	{
		parent::__construct('Admin_Model_DbTable_Users');
	}
	
	public function getAuthAdapter(array $params)
    {
    	$adapter = 
			new Zend_Auth_Adapter_DbTable(
                $this->getDbTable()->getAdapter(),
                'users',
                'username',
                'password'
			);
 
        $adapter->setIdentity($params['username']);
        $adapter->setCredential($params['password']);
		$adapter->setCredentialTreatment('md5(?)');
		return $adapter;
    }
	
}

