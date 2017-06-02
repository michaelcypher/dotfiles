set -e
# Symlink dotfiles in this folder to the HOME folder
PWD=`pwd`
rm -rf ~/.config/nvim  && ln -s ${PWD}/nvim ~/.config/nvim
rm -f ~/.tmux.conf     && ln -s ${PWD}/.tmux.conf ~
rm -f ~/.tmuxline.conf && ln -s ${PWD}/.tmuxline.conf ~
rm -f ~/.zshrc         && ln -s ${PWD}/.zshrc ~
rm -f ~/.gitignore     && ln -s ${PWD}/.gitignore ~
rm -f ~/antigen.zsh    && ln -s ${PWD}/antigen.zsh ~

#
# Homebrew
#
# Install Homebrew if it does not already exist
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/michaelcypher/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
# Install Homebrew packages if they do not already exist
brew update
cat brew.txt | xargs -I {} brew install {} || brew upgrade {} || echo "failed to install {}"

# Install autoplug for vim plugins
# See https://github.com/junegunn/vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
