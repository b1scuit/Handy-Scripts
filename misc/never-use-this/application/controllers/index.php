<?php 
// Default Class
class index {
	// Run when class is created
	function __construct(){
		// Create Global functions method
		$this->GF = new GF;
		$this->File = new FileOptions;
		$this->MySQL = new MySQL;
		$this->FTP = new FTP;
	}
	function index(){
		// Loat the default HTML header
		$this->GF->View('Default/html_header');
		// View information on currently installed librarys
		$this->GF->LibraryInfo();
		
		
		$Table = array(
			'Username' => 'VARCHAR(50)'
		);
		$this->MySQL->createtable('Users', $Table);
		// Load the default HTMLfooter
		$this->GF->View('Default/html_footer');	
	}
	function install(){
		// State the obvious
		echo "<h1>Installing Program</h1>";
		
		// Arrays of table data 
		$UsersTable = array(
			'Username' => 'VARCHAR(50)',
			'Password' => 'VARCHAR(255)'
		);
		$UserInfoTable = array (
			'First_Name' => 'VARCHAR(25)',
			'Last_Name' => 'VARCHAR(25)',		
			'DOB' => 'TIMESTAMP',
			'LandLine' => 'VARCHAR(15)', 
			'Mobile' => 'VARCHAR(15)', 
		);
		$AddressTable = array (
			'Address_Line_1' => 'VARCHAR(25)',
			'Address_Line_2' => 'VARCHAR(25)',
			'Address_Line_3' => 'VARCHAR(25)',
			'Post_Code' => 'VARCHAR(15)'
		);
		
		// Create users table
		if($this->MySQL->createtable('Users',$UsersTable)) echo "<p style='color:00FF00; '>Users Table Created</p>";
		else echo "<p style='color:FF0000; '>Error creating Users table</p>";
		// Create user info table
		if($this->MySQL->createtable('UsersInfo',$UserInfoTable)) echo "<p style='color:00FF00; '>Users information Table Created</p>";
		else echo "<p style='color:FF0000;'>Error creating Users information table</p>";
		// Create users addresses table
		if($this->MySQL->createtable('Address',$AddressTable)) echo "<p style='color:00FF00; '>Address Table Created</p>";
		else echo "<p style='color:FF0000;'>Error creating Address table</p>";
	}
}
?>