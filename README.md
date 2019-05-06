# vim config install

clone the repository 
note the plugins are installed as git submodules.  

```bash
git clone --recurse-submodules git@github.com:nickabs/vimconfig.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

# adding/updating plugins 

```bash
cd ~/vim
git submodule add https://github.com/foo.git pack/plugins/opt/foo
```

enable the optional plugin in .vimrc
```viml
:packadd! foo 
```

--recurse-submodules (above) is equivalent to:
```bash
git submodule init;git submodule update
```
...and gets the plugin subdirectories in the state orginally commmitted

to get the latest version of the plugins:
```bash
git submodule update --remote
```
this is equivalent to running fetch and  merge origin/master from each plugin directory

