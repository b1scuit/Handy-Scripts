cd /sys/class/backlight/intel_backlight

max = $(cat max_brightness)
if [$1 < $max ] 
then
	if [$1 > 50]
	then
		echo "echo "$1" > brightness" | sudo zsh
	fi


fi

cat actual_brightness
