<?php
/*
*	This is a pre-coded controller giving the coder
*	browser based control over the librarys installed,
*	using the model through a web server, the user is advised to navigate to:
*	http://yourdomain/Library in order to activate this controller.
* 	
* 	This controller requires the Global functions library 1.1+ 
*	to operate effectivly, otherwise functionality is not gurrenteed
*	and data loss is a consideration.
*/
class Library {
	public function __construct(){
		$this->GF = new GF;
	
	}
	
	public function ViewInfo(){
		
	
	}
 
 }
?>