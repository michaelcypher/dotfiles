
# Kill all other processes that are changing the wallpaper
pid=$$
for KILLPID in `ps ax | grep '.wallpaper.sh' | awk ' { print $1;}'`
do
  if [ $pid != $KILLPID ]
  then
    kill -9 $KILLPID;
  fi
done

# Change wall paper every x seconds
while true
do
  files=(~/Documents/wallpapers/*)
  file=${files[RANDOM % ${#files[@]}]}

  feh --bg-fill $file

  sleep 5m
done
