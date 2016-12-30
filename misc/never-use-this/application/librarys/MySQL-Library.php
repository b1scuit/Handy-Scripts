<?php
/*	 PHP MySQL library
*	All settings in Configurations.php under MySQL
*	
* 	All content is authored Peter Holt(2012)
*	released under the MIT public licence
*
*	NOTE: Backup and restore options to be included
*
*/
	class MySQL {
		// Library version information DO NOT REMOVE
		static $Library = array(
			'Name' => 'MySQL Functions library', // Full Library name
			'Version' => 1.2, // Version number
			'LED' => '1355607000', // Last Edited Date
			'Author' => 'PCH', // Library author
			'Description' => 'A basic library to access MySQL in a more secure, error free manner' // Description
		);
		
		// Internal access to configuration array 'Configurations.php' 
		private $mysql;
		function __construct(){
			// Configuration file location
			$Config_file = 'Configurations.php';
			// Check for valid connection
			if(!$this->mysql = $this->settings($Config_file)) $this->install($Config_file);
			// If no connection, check
			if(!$this->connect()) echo mysql_error();
		}	
		function insert($Table, $Data){
			if(!empty($Table) && !empty($Data)){
				$Fields = '';
				$Values = '';
				foreach($Data as $Field => $Value){
					if(!empty($Fields))  $Fields .= ',';
					if(!empty($Values))	$Values .=',';
					$Fields .= '`'.$Field.'`';
					$Values .= '\''.$Value.'\'';
				}
				$Table = $this->mysql['TablePrefix'].$Table;
				if(mysql_query("INSERT INTO `$Table` ($Fields) VALUES ($Values)")){
					return TRUE;
				} else return FALSE;
			} else return FALSE;		
		}
		function select($Table, $Where = NULL,$Multi = FALSE, $Order = NULL, $Limit = NULL){
			if(!empty($Table)){
				$Table = $this->mysql['TablePrefix'].$Table;
				$Query = "SELECT * FROM `$Table`";
				if(!empty($Where)) $Query .= " WHERE $Where ";
				if(!empty($Order)) $Query .= " ORDER BY $Order ASC";
				if(!empty($Limit)) $Query .= " LIMIT $Limit";	
				if(!$Query = mysql_query($Query)) {
					echo mysql_error();
					return FALSE;
				} else {
					if(@mysql_num_rows($Query) > 0){
						if($Multi === FALSE){
							return mysql_fetch_array($Query);
						} else {
							$Results = array();
							while($Res = mysql_fetch_assoc($Query)){
								$Results[] = $Res;
							}
							return $Results;
						}
					} else return FALSE;
				}
			} else return FALSE;
		}
		function update($Table, $Where = null, $Update = null){
			if(!empty($Table)){
				$Table = $this->mysql['TablePrefix'].$Table;
				$Query = " UPDATE `$Table` SET ";
				foreach($Update as $Key => $Value){
					$Query .= "`$Key` = '$Value',";				
				}
				$Count = strlen($Query);
				$Count = $Count - 1;
				$Query = substr($Query,0,$Count);
				if(!empty($Where)) $Query .= " WHERE $Where ";
				return $Query;
			} else return FALSE;	
		}
		function delete($Table, $Where){
			if(!empty($Table)){
				$Table = $this->mysql['TablePrefix'].$Table;
				$Query = "DELETE FROM `$Table` ";
				if(!empty($Where)) $Query .= " WHERE $Where ";
			} else return FALSE;
		}
		function Rows($Table){
			if(!empty($Table)){
				$Table = $this->mysql['TablePrefix'].$Table;
				$Result = mysql_num_rows(mysql_query('SELECT * FROM '.$Table));
				return $Result;
			} else return FALSE;		
		}
		function createdatabase(){
			if(!empty($this->mysql['Database'])){
				$Database = $this->mysql['Database'];
				$Query = "CREATE DATABASE IF NOT EXISTS `$Database` CHARACTER SET ".$this->mysql['Character_Set']." COLLATE ".$this->mysql['Collate'];
				if(mysql_query($Query)){
					return TRUE;
				} else return FALSE;			
			} else return FALSE;	
		}
		function createtable($Table, $Fields){ 
			if(!empty($Table)){
				if(!empty($Fields)){
					$Table = $this->mysql['TablePrefix'].$Table;
					$Query = "CREATE TABLE IF NOT EXISTS `$Table` (ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, ";
					foreach($Fields as $Key => $Value){
						$Query .=  "\n $Key $Value,";
					}
					// Calculate the length of the string, subtract one and cut the rest of the string out, 
					// eliminating the last letter 
					$Count = strlen($Query);
					$Count = $Count - 1;
					$Query = substr($Query,0,$Count);
					$Query .= "\n )  ENGINE=".$this->mysql['Engine'].";";
					if(mysql_query($Query)){
						return TRUE;
					} else return FALSE;					
				}	else return FALSE;		
			} else return FALSE;
		}
		function CheckExists($Table){
			if(!empty($Table)){
				$Table = $this->mysql['TablePrefix'].$Table;
				$Query = "SHOW TABLES LIKE '$Table'";
				$Ebay = mysql_fetch_array(mysql_query($Query));
				if(!empty($Ebay)){
					return TRUE;
				} else return FALSE;
			} return FALSE;		
		}
		function connect(){
			// Check for populated settings
			if(!empty($this->mysql['Server']) && !empty($this->mysql['Username'])){
				// Connect to mysql socket
				if($Con = mysql_connect($this->mysql['Server'],$this->mysql['Username'],$this->mysql['Password'])){
					// Check if Database is defined
					if(!empty($this->mysql['Database'])){
						// Connect to the Database	
						if(mysql_select_db($this->mysql['Database'])){
							// If successfull return TRUE
							return TRUE;
						// If not successful, attempt to create the database
						} elseif ($this->createdatabase()){
							if(mysql_select_db($this->mysql['Database'])){
								// If successfull return TRUE
								return TRUE;
							} else return FALSE;						
						} else return FALSE;
					} else return FALSE;				
				} else return FALSE;			
			} else return FALSE;
		}
	// Installation functions
	function settings($Configuration){
		if(!empty($Configuration)){
			if(file_exists($Configuration)){
				if(include($Configuration)){
					if(isset($MySQL)){
						if(is_array($MySQL)){
							return $MySQL;
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
					if(isset($MySQL)){
						return TRUE;
					} 
					else {
						$Settings = '
<?php	
	// Insert MySQL connection information here
	$MySQL = array (
		\'Server\' => \'localhost\',
		\'Username\' => \'root\',
		\'Password\' => \'\',
		\'Database\' => \'mysql\',
		\'TablePrefix\' => \'\',
		\'Character_Set\' => \'latin1\',
		\'Collate\' => \'latin1_swedish_ci\',
		\'Engine\' => \'InnoDB\'
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