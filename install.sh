echo 'Copying .vimrc and .tmux.conf to home directory.'
cp .vimrc ~/.vimrc
cp .tmux.conf ~/.tmux.conf
echo 'Done.\n'

echo 'Installing ACK.'
curl http://beyondgrep.com/ack-2.14-single-file > ~/bin/ack && chmod 0755 !#:3
echo 'Done.\n'

echo 'Installing AG.'
brew install the_silver_searcher
echo 'Done.\n'

echo 'Installing thefuck'
brew install thefuck
echo 'Done.\n'

echo 'Installing Pathogen.'
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo 'Done.\n'

echo 'Installing Vim plugins.\n'
cd ~/.vim/bundle

echo 'ACK'
git clone https://github.com/mileszs/ack.vim

echo 'IndentLine'
git clone https://github.com/Yggdroot/indentLine

echo 'NerdCommenter'
git clone https://github.com/scrooloose/nerdcommenter

echo 'NerdTree'
git clone https://github.com/scrooloose/nerdtree

echo 'Vim-Airline'
git clone https://github.com/vim-airline/vim-airline

echo 'Tagbar'
git clone git://github.com/majutsushi/tagbar
echo 'Done.\n'
echo 'Exiting...'
