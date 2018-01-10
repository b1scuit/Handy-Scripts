<?php
/*	PHP Formatting library
*	This will allow text formatting, requires MySQL library 1.2 and a active 
*	MySQL connection. 
*	All settings in application/librarys/Configurations.php under Formatting.
*
*	Please ensure all settings in Configurations.php are configured BEFORE 
*	installing this library.
*	
* 	All content is authored Peter Holt(2012)
*	released under the GNU public licence
*/
class Formatting {
	// Library version information DO NOT REMOVE
	static $Library = array(
		'Name' => 'Text formatting and Smiliys Functions library', // Full Library name
		'Version' => 1.0, // Version number
		'LED' => '1355607000', // Last Edited Date
		'Author' => 'PCH', // Library author
		'Description' => 'A basic library to format text and add smilys to the application' // Description
	);
	// connection handeler
	private $connection;
	// include Formatting settings array
	private $Formatting;
	// Include the Formatting settings array
	function __construct(){
		// Check MySQL version and if correct kick start library
		if(MySQL::$Library['Version'] >= 1.2) $this->MySQL = new MySQL;
		else echo "Incorrect MySQL library version installed";
		// include the Formatting settings array
		$Config_file = 'application/librarys/Configurations.php';
		if(!$this->Formatting = $this->settings($Config_file)) $this->install($Config_file);
		// Install MySQL tables
		if(!$this->installMySQL()) echo "Error installing library";
	}
	
	function FormatText($Input){
		if(!empty($Input)){
			// Obtain Shortcut Links
			$Shortcut = str_split($this->Formatting['CallSign']);
			// Download all smilys from MySQL
			if($Smilys = $this->MySQL->select($this->Formatting['TableName'], NULL, TRUE)){
				// Cycle through Smilys searching text
				if(!empty($Smilys)){
					foreach($Smilys as $Value){
						$Input = str_ireplace($Shortcut[0].$Value['Shortcut'].$Shortcut[1],'<img src ="'.$Value['Link'].'" width="16" height="16" />',$Input);
					}	
				}
			}
			// Replace Library
			$Replace = array (
				// NVC F Code => HTML Equilivant
				'B' => 'b',
				'I' => 'i',
				'U' => 'u',
				'S' => 's',
				'Center' => 'center',
				'Code' => 'code',
				'H1' => 'h1',
				'H2' => 'h2',
				'H3' => 'h3',
				'H4' => 'h4',
				'H5' => 'h5',
				'H6' => 'h6'
				); 
			foreach($Replace as $Key => $Value){
				$Input = str_ireplace($Shortcut[0].$Key.$Shortcut[1],'<'.$Value.'>',$Input);
				$Input = str_ireplace($Shortcut[0].'/'.$Key.$Shortcut[1],'</'.$Value.'>',$Input);
			}
			return $Input;
		} else return FALSE;	
	}	
	function installMySQL(){
		if(!$this->MySQL->CheckExists($this->Formatting['TableName'])){
			$Table = array(
				'Name' => 'VARCHAR(20)', 
				'Shortcut' => 'VARCHAR(20)',
				'Sub' => 'Bool',
				'Link' => 'TEXT'
			);
			if($this->MySQL->createtable($this->Formatting['TableName'], $Table)){
				return TRUE;
			} else echo FALSE;
		} else return TRUE;
	}
	function settings($Configuration){
		if(!empty($Configuration)){
			if(file_exists($Configuration)){
				if(include($Configuration)){
					if(isset($Formatting)){
						if(is_array($Formatting)){
							return $Formatting;
						} else return FALSE;
					} else return FALSE;
				} else return FALSE;
			} else return FALSE;			
		} else return FALSE;	
	}	
	function install($Configuration){
		if(!empty($Configuration)){
				if(file_exists($Configuration)){
					if($this->connection = fopen($Configuration, 'a+')){
						if(isset($Formatting)){
							return TRUE;
						} else {
							$Settings = '
<?php	
	// Insert formatting data here
	// Configure BEFORE use. 
	// CallSign is the symbols to identify NVC Formatting tags, these can be %%, [], (), <>, {} etc.
	$Formatting = array (
		\'TableName\' => \'Smilys\',
		\'CallSign\' => \'[]\'
	); 
?>';
							if(fwrite($this->connection,$Settings)){
								if(fclose($this->connection)){
									return TRUE;
								} else return FALSE;
							} else return FALSE;
						}
					} else return FALSE;
				} else return FALSE;			
			} else return FALSE;
	}
}
?>
