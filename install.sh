
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
git clone https://github.com/mileszs/ack.vim
git clone https://github.com/Yggdroot/indentLine
git clone https://github.com/scrooloose/nerdcommenter
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/msanders/snipmate.vim
echo 'Installed Vim plugins!'

