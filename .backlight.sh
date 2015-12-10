
# Set background brightness
x=$(cat /sys/class/backlight/*/brightness)

if [[ $1 = 'up' ]] 
then
    x=$(($x + 64))
fi

if [[ $1 = 'down' ]] 
then
    x=$(($x - 64))
fi

x=$((x > 1023 ? 1023 : x))
x=$((x < 0 ? 0 : x))

echo $x | sudo tee /sys/class/backlight/gmux_backlight/brightness
