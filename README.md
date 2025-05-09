# vimrc

You are free to use my .vimrc and to modify it as you want !

Be careful, arrows are disabled - coding with vim the true way !

To install it, execute the following in the terminal : 

```sh
cd ~ && \
git clone https://github.com/kennethrioja/vimrc.git && \
ln -s ~/vimrc/.vimrc ./ && \
mkdir -p .cache && \
if [ ! -d ~/.cache/vim ]; then mkdir ~/.cache/vim ; fi && \
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
vim +'PlugInstall --sync' +qa
```

Also install [vim-gitgutter](https://github.com/airblade/vim-gitgutter) !

For an alias on MacOS to open vimwiki simply by executing `ww`, run this command in the terminal:

```sh
echo "alias ww='vim -c VimwikiIndex'" >> ~/.zshrc
source ~/.zshrc
```

## For the 42 students out here :

To enable the 42 header, execute these lines in the terminal **while replacing** ```YOURUSERNAME``` and ```YOUREMAILADDRESS``` by yours :

```sh
mv ~/.vim/plugged/42header/plugin/ ~/.vim/ && \
sed -ie 's/krioja/YOURUSERNAME/g' ~/.vimrc && \
sed -ie 's/marvin@lausanne.ch/YOUREMAILADDRESS/g' ~/.vimrc
```

## Using WSL and vimwiki ?

To allow vimwiki to open URLs, execute this :

```sh
echo -e '\n# for vimwiki URLs to work in WSL\nexport BROWSER="powershell.exe /C start"' >> ~/.bashrc && \
source ~/.bashrc
```
