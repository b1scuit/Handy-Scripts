<?php
class GF {
	private $HTMLDumpCount = 1;
	// Library version information DO NOT REMOVE
	static $Library = array(
		'Name' => 'Global Functions library', // Full Library name
		'Version' => 1.2, // Version number
		'LED' => '1355607000', // Last Edited Date
		'Author' => 'PCH', // Library author
		'Description' => 'The Primary library for NVC, this contains consistently reused code' // Description
	);
	private $GlobalFunctions;
	function __construct(){
		$Config_file = 'application/librarys/Configurations.php';
		if(!$this->GlobalFunctions = $this->settings($Config_file)) $this->install($Config_file);
		if(Formatting::$Library['Version'] >= 1.0) $this->GlobalFunctions['NVCFC'] = TRUE;
	}
	
	function clean($file = NULL){
		if(empty($file)) $file = $_POST;
		$result = array();
		foreach ($file as $key =>$value){
			if(!$result[$key] = mysql_real_escape_string($value)){
				return FALSE;
			}
		} return $result;
	}
	function Display($Display){
		if(!empty($Display)){
			if(isset($this->GlobalFunctions['NVCFC'])){
				$Formatting = new Formatting;
				echo $Formatting->FormatText($Display);
				return TRUE;
			} else {
				echo $Display;
				return TRUE;
			}			
		} else return FALSE;	
	}
	function View($View){
		if(!empty($View)){
			if(file_exists($this->GlobalFunctions['ViewDirectory'].$View.$this->GlobalFunctions['Extension'])){
				if(@require_once($this->GlobalFunctions['ViewDirectory'].$View.$this->GlobalFunctions['Extension'])){
				}else return FALSE;
			} else return FALSE;
		} else return FALSE;	
	}
	function LibraryInfo($LibraryList = null){
		if (empty($LibraryList)) $LibraryList = get_declared_classes();
		if(is_array($LibraryList)){
			foreach($LibraryList as $LibraryName){
				if(!empty($LibraryName::$Library)){
					echo '<textarea>';
					echo 'Name: '.$LibraryName::$Library['Name']."\n";
					echo 'NVC Calling name : '.$LibraryName."\n";
					echo 'Version: '.$LibraryName::$Library['Version']."\n";
					echo 'Author: '.$LibraryName::$Library['Author']."\n";
					echo 'LED: '.date('d/m/Y',$LibraryName::$Library['LED'])."\n";
					echo 'Description: '.$LibraryName::$Library['Description']."\n";
					echo '</textarea>';				
				}
			}							
		} else{
			if(!empty($LibraryList::$Library)){
				echo '<textarea>';
				echo 'Name: '.$LibraryList::$Library['Name']."\n";
				echo 'NVC Calling name : '.$LibraryList."\n";
				echo 'Version: '.$LibraryList::$Library['Version']."\n";
				echo 'Author: '.$LibraryList::$Library['Author']."\n";
				echo 'LED: '.date('d/m/Y',$LibraryList::$Library['LED'])."\n";
				echo 'Description: '.$LibraryList::$Library['Description']."\n";
				echo '</textarea>';
			} else return FALSE;
		}
	}
	// This function will only work with JQuery 1.8+ included in any views called before it
	function HTMLDump($variable) {
		echo '
			<script> 
				$(document).ready(function(){
				  $(".Button'.$this->HTMLDumpCount.'").click(function(){
					$(".Panal'.$this->HTMLDumpCount.'").slideToggle("slow");
				  });
				});
			</script>
			<style>
			.Panal'.$this->HTMLDumpCount.'{
				border: 1px solid #000; 
				height: {20em}; 
				overflow: auto; 
				margin: 0.5em;
				display:none;
			}		
			</style>';
		echo '<h3><div class="Button'.$this->HTMLDumpCount.'">HTMLDump Results ('.$this->HTMLDumpCount.')</div></h3>';
		echo '<div class="Panal'.$this->HTMLDumpCount.'" ><pre>';
		var_dump($variable);
		echo "</pre></div>\n";
		$this->HTMLDumpCount++;
	}
	function settings($Configuration){
			if(!empty($Configuration)){
				if(file_exists($Configuration)){
					if(include($Configuration)){
						if(isset($GlobalFunctions)){
							if(is_array($GlobalFunctions)){
								return $GlobalFunctions;
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
						if(isset($GlobalFunctions)){
							return TRUE;
						} else {
							$Settings = '
<?php	
	// Insert global functions data here
	$GlobalFunctions = array (
		\'ViewDirectory\' => \'application/views/\',
		\'Extension\' => \'.php\'
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