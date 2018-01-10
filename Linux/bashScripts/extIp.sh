VAR=$(curl -s http://ip.jsontest.com/ | json-query "ip" ) | zenity --info --text="External IP:\n $VAR"
