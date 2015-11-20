#! /bin/bash 


#################################
## Animated PS1 Command Prompt ##
#################################

OLD_IFS="$IFS"
IFS='%'

SIZE=15

make_length() {
  str=$1
  len=$2

  while [ $(echo ${#str}) -gt $len ]
  do
    len=$(($len + $len))
  done

  while [ $(echo ${#str}) -lt $len ]
  do
    str+=" "
  done

  echo $str 
}

concat_ps1() {
    str=""
    username=$(whoami)

    dir=$(basename `pwd`)
    if [ $dir = $username ]
    then
      dir='~'
    fi

    username=$(make_length $username $SIZE)
    dir=$(make_length $dir $SIZE)

    hostname=$(hostname -s)
    hostname=$(make_length $hostname $SIZE)
    str+=$username$hostname$dir

    t=$(date +"%T")
    t=$(make_length $t $SIZE)
    str+=$t

    branch=$(git branch 2> /dev/null | grep '*')
    if [ -n "$branch" ]; then
      branch=$(make_length $branch $SIZE)
      str+=$branch
    fi

    echo $str
}

echo_to_box() {
  POS=$1
  STR=$2
  COLOR=$3

  NOC='\033[0m' # restore colour

  S="\033[s" # save cursor position
  U="\033[u" # restore cursor position

  eval echo -ne '$COLOUR${S}${POS}$STR${U}${NOC}'
}

animation() {
  # move cursor back 1000 columns (start of line)
  # move cursor forward 2 columns
  POS="\033[1000D\033[2C"
  COLOUR='\033[1;36m'

  while [ : ]
  do
      str=$(concat_ps1)
      start=0

      while [ $start -lt ${#str} ]
      do
          substr=${str:$start:$SIZE}

          echo_to_box $POS $substr $COLOR
          sleep 2

          i=1
          while [ "$i" -le "$SIZE" ]; do
             start=$(($start + 1))
             substr=${str:$start:$SIZE}

             echo_to_box $POS $substr $COLOR
             sleep 0.05
             i=$(($i + 1))
          done
      done
  done
}

animation_pid=-1
FIRST_PROMPT=1
PRE_COUNT=0

PreCommand() {
  if [ -z "$AT_PROMPT" ]; then
    return
  fi
  unset AT_PROMPT

  # Do stuff.
  if [ $PRE_COUNT -ge 1 ]; then
    POS="\033[1A\033[1000D\033[2C"
    COLOUR='\033[0;36m'
    time=$(date +"%T")
    str=$(make_length $time $SIZE)
    echo_to_box $POS $str $COLOUR
  fi

  if [ $animation_pid -ne -1 ]; then
    kill $animation_pid 
    wait $! 2>/dev/null
  fi

  PRE_COUNT=$(($PRE_COUNT + 1))
}
trap "PreCommand" DEBUG

PostCommand() {
  AT_PROMPT=1

  if [ -n "$FIRST_PROMPT" ]; then
    unset FIRST_PROMPT
    return
  fi

  animation &
  animation_pid=$!
}
PROMPT_COMMAND="PostCommand"

PostCommand
PS1='[                 ] $ '


#############
## Aliases ##
#############

alias up='cd ..'
alias back='cd -'
alias rm='rm -r'
alias cp='cp -r'

# Ubuntu / Linux Distro aliases
# Todo: Only run these on specified OSs
alias mypkgs='apt-cache pkgnames'
alias wifilist='nmcli dev wifi list'

connect_to_wifi() {
    name=$1
    password=$2

    nmcli dev wifi con $1 password $2
}

alias wificon=connect_to_wifi
alias wifioff='nmcli radio wifi off' 
alias wifioff='nmcli radio wifi on' 

