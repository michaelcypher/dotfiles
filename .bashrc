#######################
# Print a nice greeting
#######################

H=$(date +%H)
if (( 8 <= 10#$H && 10#$H < 12 )); then 
    echo "🌞  Good morning"
elif (( 12 <= 10#$H && 10#$H < 18 )); then 
    echo "🌝  Good afternoon"
else
    echo "🌚  Good evening"
fi

alias vim='~/bin/vim'


######################
# Yelp related aliases
######################

alias ym='cd ~/pg/yelp-main/'
alias nuke='make clean && make && pgctl stop && sleep 1 && pgctl start && echo "nuked"'
alias test='seagull-run'
alias test-js='tools/mocha.py'
alias review='review-branch'


#####################
# Git related aliases
#####################

alias gadd="git add --all"
alias gcommit='git commit -m'
alias gcommit-add='git commit -a --amend --no-edit'

alias gpush='git push -f origin HEAD'

# Delete branch locally and from origin (often after pull request)
delete_branch() {
    git push --delete origin $1 && git branch -d $1
}
alias gb='git branch'
alias gb-new='git fetch canon && git checkout canon/master -b'
alias gb-delete=delete_branch

alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias gstash='git stash --keep-index'
alias gpop='git stash pop'


######################
# Tmux related aliases
######################

alias tmux='agenttmux -2'
alias tmux-new='agenttmux -2 new -s'
alias tmux-attach='agenttmux -2 attach -t'
alias tmux-kill='agenttmux kill-session -t'
