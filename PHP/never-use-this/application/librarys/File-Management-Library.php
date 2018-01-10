<?php
class FileOptions {
		// Library version information DO NOT REMOVE
	static $Library = array(
		'Name' => 'File Management library', // Full Library name
		'Version' => 0.1, // Version number
		'LED' => '1355607000', // Last Edited Date
		'Author' => 'PCH', // Library author
		'Description' => 'A Library to manage files on the server' // Description
	);
	private $File;
	function __construct(){
		$Config_file = 'application/librarys/Configurations.php';
		if(!$this->File = $this->settings($Config_file)) $this->install($Config_file);
	}
	function CheckExists($File){
		if(!empty($File)){
			if(file_exists($this->File['DefaultSaveLocation'].$File)){
				return TRUE;
			} else return FALSE;
		} else return FALSE;	
	}
	function DeleteFile($File){
		if(!empty($File)){
			if(unlink($this->File['DefaultSaveLocation'].$File)){
				return TRUE;
			} else return FALSE;
		} else return FALSE;	
	}
	function UploadFile(){}
	function MoveFile(){}
	function CopyFile(){}
	function EditFile(){}
	
	// Installation functions
	function settings($Configuration){
		if(!empty($Configuration)){
			if(file_exists($Configuration)){
				if(include($Configuration)){
					if(isset($FileOptions)){
						if(is_array($FileOptions)){
							return $FileOptions;
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
					if(isset($FileOptions)){
						return TRUE;
					} 
					else {
						$Settings = '
<?php	
	// Insert File options information here
	// All file paths require backslash (/) at the end
	$FileOptions = array (
		\'DefaultSaveLocation\' => \'\',
		\'MaxSize\' => \'1024\'
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