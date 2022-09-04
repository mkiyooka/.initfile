if [ -z "$PS1" ]; then
    return
fi

# default:cyan / root:red
if [ $UID -eq 0 ]; then
    PS1="[\[\033[31m\]\u@\h\[\033[00m\] \[\033[32m\]\W\[\033[00m\]]> "
else
    PS1="[\[\033[36m\]\u@\h\[\033[00m\] \[\033[32m\]\W\[\033[00m\]]\\$ "
fi

# "-F":ディレクトリに"/"を表示 / "-G"でディレクトリを色表示
case "${OSTYPE}" in
    darwin*)
        export LSCOLORS=gxfxcxdxbxegedabagacad
        alias ls='ls -FG'
        alias ll='ls -alFG'
        alias la="ls -laG"

        # XDG Base Directory
        export XDG_CONFIG_HOME=$HOME/.config
        export XDG_DATA_HOME=$HOME/.data
        export XDG_CACHE_HOME=$HOME/.cache
        export XDG_RUNTIME_HOME=$HOME/.runtime

        if [ -e $HOME/.local/bin ]; then
            export PATH=$HOME/.local/bin:$PATH
        fi

        if [ -f `brew --prefix`/etc/bash_completion ]; then
            source `brew --prefix`/etc/bash_completion
        fi
        export JAVA_HOME=`/usr/libexec/java_home -v 1.8` #java8が使いたいとき
        #export GRADLE_HOME=$(brew info gradle | grep /usr/local/Cellar/gradle | awk '{print $1}')
        export GRADLE_HOME=/usr/local/Cellar/gradle/5.4
        export NVM_DIR="$HOME/.nvm"
        [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
        [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
        #brew services start emacs
        alias emg='emacs'
        alias em='emacs -nw'
        alias E='emacsclient -t'
        alias kill-emacs="emacsclient -e '(kill-emacs)'"
        [ -s "`brew --prefix`/bin/ctags" ] && alias ctags="`brew --prefix`/bin/ctags"
        export EDITOR=vim
        [ -s `command -v direnv` ] && eval "$(direnv hook bash)"
        ;;
    linux*)
        if [ -f $HOME/.initfile/colorrc ]; then
            eval `dircolors $HOME/.initfile/colorrc`
        fi
        alias ls='ls --color=auto'
        alias ll='ls -l --color=auto'
        alias la='ls -la --color=auto'

        # XDG Base Directory
        export XDG_CONFIG_HOME=$HOME/.config
        export XDG_DATA_HOME=$HOME/.data
        export XDG_CACHE_HOME=$HOME/.cache
        export XDG_RUNTIME_HOME=$HOME/.runtime

        if [ -f /etc/profile.d/bash_completion.sh ]; then
            source /etc/profile.d/bash_completion.sh
        fi
        if [ -f /usr/local/bin/vim ]; then
            alias vim='/usr/local/bin/vim'
            alias vi='/usr/local/bin/vim'
        fi
        # for Ruby
        if [ -e $HOME/.rbenv/bin ]; then
            export PATH=$HOME/.rbenv/bin:$PATH
            eval "$(rbenv init -)"
        fi
        # for Rust
        export CARGO_HOME=$XDG_DATA_HOME/cargo
        if [ -e $CARGO_HOME/bin ]; then
            export PATH=$CARGO_HOME/bin:$PATH
        fi
        # for Golang
        if [ -s `brew --prefix`'/Cellar/go/' ]; then
            p=`brew --prefix`'/Cellar/go/'
            export GOROOT="$p`ls $p`/libexec/"
        fi
        # for self-built gcc/g++
        export LD_LIBRARY_PATH=/usr/lib:/usr/lib64
        if [ -e /usr/local/lib ]; then
            export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
        fi
        if [ -e /usr/local/lib64 ]; then
            export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
        fi
        ;;
    msys*)
        alias ls='ls --color=auto'
        alias ll='ls -l --color=auto'
        alias la='ls -la --color=auto'

        # for Rust
        export CARGO_HOME=$XDG_DATA_HOME/cargo
        if [ -e $CARGO_HOME/bin ]; then
            export PATH=$CARGO_HOME/bin:$PATH
        fi
        # for Golang
        export GOPATH=$XDG_DATA_HOME/go
        if [ -e $GOPATH/bin ]; then
            export PATH=$GOPATH/bin:$PATH
        fi
        ;;
esac

which col &> /dev/null; RETURN_CODE=$?
if [ -f /bin/sh ] && [ $RETURN_CODE = 0 ]; then
    export MANPAGER="/bin/sh -c \"col -b -x|vim -R -c 'set ft=man nolist nonu noma' -\""
fi

function _compreply_ssh() {
  COMPREPLY=(`cat ~/.ssh/config* | grep -e '^Host' | cut -d " " -f 2 | grep -E "$2"`)
}
complete -F _compreply_ssh ssh


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
