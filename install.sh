
cp .vimrc ~/.vimrc

echo 'Installing ACK!'
curl http://beyondgrep.com/ack-2.14-single-file > ~/bin/ack && chmod 0755 !#:3
echo 'Installed ACK!'

echo 'Install Pathogen!'
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo 'Installed Pathogen!'

echo 'Installing Vim plugins!'
cd ~/.vim/bundle
echo 'Installing Ack for super fast code search!'
git clone https://github.com/mileszs/ack.vim
echo 'Installing IndentLine for visible indentation!'
git clone https://github.com/Yggdroot/indentLine
echo 'Installing NerdCommenter for easy commenting!'
git clone https://github.com/scrooloose/nerdcommenter
echo 'Installing NerdTree for amazing file navigation!'
git clone https://github.com/scrooloose/nerdtree
echo 'Installing Vim-Airline for a sexy tool bar!'
git clone https://github.com/vim-airline/vim-airline
echo 'Installing SnipMate for autocomplete!'
git clone https://github.com/msanders/snipmate.vim
echo 'Installing Tmuxline for intergrated vim and tmux tool bars!'
git clone https://github.com/edkolev/tmuxline.vim
echo 'Installed Vim plugins!'

