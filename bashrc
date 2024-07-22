if [ -z "$PS1" ]; then
    return
fi

# default:cyan / root:red
if [ $UID -eq 0 ]; then
    PS1="[\[\e[31m\]\u@\h\[\e[00m\] \[\e[32m\]\W\[\e[00m\]]> "
else
    PS1="[\[\e[36m\]\u@\h\[\e[00m\] \[\e[32m\]\W\[\e[00m\]]\\$ "
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
        # for Golang
        if [ -s `brew --prefix`'/Cellar/go/' ]; then
            p=`brew --prefix`'/Cellar/go/'
            export GOROOT="$p`ls $p`/libexec/"
        fi
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
        # for self-built gcc/g++
        export LD_LIBRARY_PATH=/usr/lib:/usr/lib64
        if [ -e /usr/local/lib ]; then
            export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
        fi
        if [ -e /usr/local/lib64 ]; then
            export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
        fi
        # for Python
        if [ -e $HOME/.local/venvs ]; then
            export WORKON_HOME=$HOME/.local/venvs
        fi
        if [ -f $HOME/.local/venvs/Pipfile ]; then
            export PIPENV_PIPFILE=$HOME/.local/venvs/Pipfile # 絶対パスで指定する
        fi
        # ssh-agent
        if [ -z "$SSH_AUTH_SOCK" ]; then
            # Check for a currently running instance of the agent
            RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
            if [ "$RUNNING_AGENT" = "0" ]; then
                # Launch a new instance of the agent
                ssh-agent -s &> .ssh/ssh-agent
            fi
            eval `cat .ssh/ssh-agent`
        fi
        ;;
    msys*)
        alias ls='ls --color=auto'
        alias ll='ls -l --color=auto'
        alias la='ls -la --color=auto'
        #alias make='mingw32-make'

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
        # ssh-agent

        env=~/.ssh/agent.env

        agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

        agent_start () {
            (umask 077; ssh-agent >| "$env")
            . "$env" >| /dev/null ; }

        agent_load_env

        # agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
        agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

        if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
            agent_start
            ssh-add
        elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
            ssh-add
        fi

        unset env

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

export XDG_CONFIG_HOME=$HOME/.config
