<?php
/*	 PHP FTP library
*	All settings in application/librarys/Configurations.php under FTP
*	
* 	All content is authored Peter Holt(2012)
*	released under the GNU public licence
*/


class FTP {
	// Library version information DO NOT REMOVE
	static $Library = array(
		'Name' => 'File Transfer Protocol Functions library', // Full Library name
		'Version' => 1, // Version number
		'LED' => '1355607000', // Last Edited Date
		'Author' => 'PCH', // Library author
		'Description' => 'A basic library to access FTP servers in a more secure, error free manner' // Description
	);
	// connection handeler
	private $connection;
	// include FTP settings array
	private $FTP;
	
	// Include the FTP settings array
	function __construct(){
		// include the FTP settings array
		$Config_file = 'application/librarys/Configurations.php';
		if(!$this->FTP = $this->settings($Config_file)) $this->install($Config_file);
	}
	
	function connect(){
		// Check settngs array present
		if(!empty($this->FTP)){
		// Check for SSL connection wanted
			if($this->FTP['SSL']){
				// connect to the FTP
				if($this->connection = ftp_ssl_connect($this->FTP['server'], $this->FTP['port'],$this->FTP['timeout'])){
					// If the connection successful, log in 
					if(ftp_login($this->connection, $this->FTP['username'], $this->FTP['password'])) {
						// Change to the desired default directory
						if(ftp_chdir ($this->connection ,$this->FTP['default_working_directory'] )&&  ftp_pasv($this->connection,$this->FTP['passive'])){
							// End and return connection was successful
							return true;
						} else {
							// Terminate active connection
							$this->close();
							return FALSE;
						}
					} else return FALSE;
				} else return FALSE;
			} 
			else {
				// connect to SSL ftp
				if($this->connection = ftp_connect($this->FTP['server'], $this->FTP['port'],$this->FTP['timeout'])) {
					// If the connection successful, log in 
					if(ftp_login($this->connection, $this->FTP['username'], $this->FTP['password'])) {
						// Change to the desired default directory
						if(ftp_chdir ($this->connection ,$this->FTP['default_working_directory'] ) &&  ftp_pasv($this->connection,$this->FTP['passive'])){
							// End and return connection was successful
							return true;
						} else {
							// Terminate active connection
							$this->close();
							return FALSE;
						}
					} else return FALSE;
				} else	return FALSE;
			}
		} else return FALSE;
	}
	function upload($file, $Rfile = NULL){
		// Check for FTP settings array and a active connection
		if(!empty($this->FTP)  && !empty($this->connection)){
			// Check the local file exists
			if(file_exists($file)){
				// Check if a remote file name was declared
				if($Rfile == NULL) $Rfile = $file;
				// Check if mode is FTP_ASCII
				if($this->FTP['mode'] == 'FTP_ASCII'){
					// Upload to FTP server using active connection
					if(ftp_put ($this->connection,$Rfile,$file,FTP_ASCII,$startpos = 0)){
						// End and return if upload successful
						return TRUE;
					} else return FALSE;
				}
				// Check if mode is FTP_BINARY
				elseif($this->FTP['mode'] == 'FTP_BINARY'){
					// Upload to FTP server using active connection
					if(ftp_put ($this->connection,$Rfile,$file,FTP_BINARY,$startpos = 0)){
						// End and return if upload successful
						return TRUE;
					} else return FALSE;
				} else return FALSE;
			} else return FALSE;
		} else return FALSE;
	}
	function download($file, $Rfile = NULL){
		// Check for FTP settings array and for a active conneection
		if(!empty($this->FTP) && !empty($this->connection)){
			// Check if local file is deined
			if($Rfile == NULL) $Rfile = $file;
			// Check if file exists
			if($this->size($file)){
				// Check if mode is FTP_ASCII
				if($this->FTP['mode'] == 'FTP_ASCII'){
					// Dowload to client using active connection
					if(ftp_get($this->connection,$Rfile,$file,FTP_ASCII,$resumepos = 0)){
						// Return TRUE if successful download
						return TRUE;
					} else return FALSE;
				}
				/// Check if mode is FTP_BINARY
				elseif($this->FTP['mode'] == 'FTP_BINARY'){
					// Download to client using active connection
					if(ftp_get($this->connection,$Rfile,$file,FTP_BINARY,$resumepos = 0)){
						// Return TRUE if successful download
						return TRUE;
					} else return FALSE;
				} else return FALSE;
			} else return FALSE;
		} else return FALSE;
	}
	function size($file){
		// Check for the FTP settings array and a active connection
		if(!empty($this->FTP) && !empty($this->connection)){
			if($size = ftp_size ($this->connection,$file)){
				if($size > 0){
					return $size;
				} else {
					return FALSE;
				}
			} else return FALSE;		
		} else return FALSE;
	}
	function chmod($file, $permission){
		// Check for the FTP settings array and a active connection
		if(!empty($this->FTP) && !empty($this->connection)){
			if($this->size($file)){
				if($npermissions = ftp_chmod($this->connection, $permission, $file)){
					return $npermissions;
				} else return FALSE;
			} else return FALSE;
		} else return FALSE;
	}
	function pwd(){
		// Check for the FTP settings array and a active connection
		if(!empty($this->FTP) && !empty($this->connection)){
			if($pwd = ftp_pwd($this->connection)){
				return $pwd;
			} else return FALSE;
		} else return FALSE;
	}
	function systype(){
		// Check for the FTP settings array and a active connection
		if(!empty($this->FTP) && !empty($this->connection)){
			// Requests the system type
			if($systype = ftp_systype($this->connection)){
				return $systype;
			} else return FALSE;
		} else return FALSE;
	}
	function chdir($directory){
		// Check for the FTP settings array and a active connection
		if(!empty($this->FTP) && !empty($this->connection)){
			// Changes the current working directory
			if(ftp_chdir($this->connection, $directory)){
				return TRUE;
			} else return FALSE;
		} else return FALSE;
	}
	function mkdir($directory){
		// Check for the FTP settings array and a active connection
		if(!empty($this->FTP) && !empty($this->connection)){
			// Creates the new directory
			if(ftp_mkdir($this->connection, $directory)){
				return TRUE;
			} else return FALSE;
		} else return FALSE;
	}
	function rename($file,$nfile){
		// Check for the FTP settings array and a active connection
		if(!empty($this->FTP) && !empty($this->connection)){
			// Check if file exists
			if($this->size($file)){
				// Renames the file or directory
				if(ftp_rename ($this->connection, $file, $nfile)){
					return TRUE;
				} else return FALSE;
			} else return FALSE;
		} else return FALSE;
	}
	function rmdir($file){
		// Check for the FTP settings array and a active connection
		if(!empty($this->FTP) && !empty($this->connection)){
				// removes the directory
				if(ftp_rmdir($this->connection, $file)){
					return TRUE;
				} else return FALSE;
		} else return FALSE;
	}
	function delete($file){
		// Check for the FTP settings array and a active connection
		if(!empty($this->FTP) && !empty($this->connection)){
			// Check if file exists
			if($this->size($file)){
				// Deletes the file
				if(ftp_delete($this->connection, $file)){
					return TRUE;
				} else return FALSE;
			} else return FALSE;
		} else return FALSE;
	}
	function close(){
		// Check for active connection
		if(!empty($this->connection)){
			// Close active connection
			if(!ftp_close($this->connection)) return FALSE;
			else return TRUE;
		}else return FALSE;
	}
	function settings($Configuration){
			if(!empty($Configuration)){
				if(file_exists($Configuration)){
					if(include($Configuration)){
						if(isset($FTP)){
							if(is_array($FTP)){
								return $FTP;
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
						if(isset($FTP)){
							return TRUE;
						} else {
							$Settings = '
<?php	
	// Insert FTP connection data here
	$FTP = array (
		\'server\' => \'localhost\',
		\'username\' => \'username\',
		\'password\' => \'password\',
		\'default_working_directory\' => \'/\',
		\'port\' => 21,
		\'timeout\' => 30,
		\'SSL\' => FALSE,
		\'passive\' => FALSE,
		\'mode\' => \'FTP_ASCII\'
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
	function usage(){
	return '<h1>FTP PHP Library usage</h1><table>
			<tr><th>Action</th><th>Command</th><th>Other notes</th></tr>
			<tr><td>to connect</td><td>$this->ftp->connect();</td><td>&nbsp;</td></tr>
			<tr><td>to close connection</td><td>$this->ftp->close();</td><td>&nbsp;</td></tr>
			<tr><td>to upload file</td><td>$this->ftp->upload(\'Path to local file\',\'Path to remote file (OPTIONAL)\');</td><td>&nbsp;</td></tr>
			<tr><td>to download file</td><td>$this->ftp->download(\'Path to remote file\',\'Path to local file (OPTIONAL)\');</td><td>&nbsp;</td></tr>
			<tr><td>to delete file</td><td>$this->ftp->delete(\'Path to remote file\');<td><td>&nbsp;</td></tr>
			<tr><td>to delete directory</td><td>$this->ftp->rmdir(\'Path to directory\');</td><td>&nbsp;</td></tr>
			<tr><td>to rename file or directory</td><td>$this->ftp->rename(\'Path to remote file/directory\',\'New file/directory name\')</td><td>&nbsp;</td></tr>
			<tr><td>to change directory</td><td>$this->ftp->chdir(\'Directory to change to\');</td><td>&nbsp;</td></tr>
			<tr><td>to check file size</td><td>$this->ftp->size(\'Path to remote file\');</td><td>(will return file size in bytes or FALSE if file does not exist)</td></tr>
			<tr><td>to change file permission</td><td>$this->ftp->chmod(\'Path to remote file\',\'new permission (in octacal e.g. 0644)\');</td><td>(will return new file permissions)</td></tr>
			<tr><td>to check current working directory</td><td>$this->ftp->pwd();</td><td>(will return the current working directory)</td></tr>
			<tr><td>to check the system type</td><td>$this->ftp->systype();</td><td>(will return the system type and FALSE if unavailable)</td></tr>
		</table><p><i>All content is authored by Peter Holt (2012), this program is released under the GNU public licence</i></p>';
	}
}
?>
