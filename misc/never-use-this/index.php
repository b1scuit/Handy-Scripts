<?php 
	session_start();
	// Load default librarys
	foreach (glob("application/librarys/*.php") as $Filename)
	{
		require_once($Filename);
	}
	// Set default parematers
	$ControllerPath = realpath('application/controllers'.'/');
	$Controller = $Method = 'index';
	$Extension = '.php';
	// Check for class 
	if(!empty($_REQUEST['Class'])){
		// If this is not the default page
		$Controller = $_REQUEST['Class'];
		if(!empty($_REQUEST['Method'])){
			// If this is not the default class/method
			$Method = $_REQUEST['Method'];
		}
	}
	// Check for correct controller exists
	if(file_exists($ControllerPath.'/'.$Controller.$Extension)){
		// Load the controller
		require_once($ControllerPath.'/'.$Controller.$Extension);
		// Check the controller settings
		if(class_exists($Controller)){
			// Start the controller
			$Class = new $Controller;
			if(method_exists($Class, $Method)){
				// Start Method
				$Class->$Method();			
			} else $Error = 'Undefined Method: '.$_REQUEST['Method'];
		} else $Error = 'Undefined Class: '.$_REQUEST['Class'];	
	} else $Error = 'Controller '.$_REQUEST['Class'].' does not exist';
	// If there is a value in the error vairible
	if(isset($Error)) {
		$GF = new GF;
		// Loat the default HTML header
		$GF->View('Default/html_header');
		// Show this Text
		echo $Error;
		// Load the default HTMLfooter
		$GF->View('Default/html_footer');	
		unset($GF);
	}