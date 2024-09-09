if [ -z "$PS1" ]; then
    return
fi

# default:green / root:red
if [ $UID -eq 0 ]; then
    PS1="\[\e[31m\]\u@\h\[\e[00m\]:\[\e[36m\]\W\[\e[00m\]> "
else
    PS1="\[\e[32m\]\u@\h\[\e[00m\]:\[\e[36m\]\W\[\e[00m\]\\$ "
fi

# ----- 共通設定 -----
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_RUNTIME_HOME=$HOME/.local/run
# bash complettion ssh
function _compreply_ssh() {
    COMPREPLY=(`cat ~/.ssh/config* | grep -e '^Host' | cut -d " " -f 2 | grep -E "$2"`)
}
complete -F _compreply_ssh ssh

case "${OSTYPE}" in
    darwin*)
        export LSCOLORS=gxfxcxdxbxegedabagacad
        alias ls='ls -FG' # "-F":ディレクトリに"/"を表示 / "-G"でディレクトリを色表示
        alias ll='ls -alFG'
        alias la="ls -laG"

        # editor
        alias emg='emacs'
        alias em='emacs -nw'
        alias E='emacsclient -t'
        alias kill-emacs="emacsclient -e '(kill-emacs)'"
        export EDITOR=vim
        [ -s "`brew --prefix`/bin/ctags" ] && alias ctags="`brew --prefix`/bin/ctags"

        [ -e $HOME/.local/bin ] && export PATH=$HOME/.local/bin:$PATH
        [ -f `brew --prefix`/etc/bash_completion ] && source `brew --prefix`/etc/bash_completion

        # for Rust
        [ -f $HOME/.cargo/env ] && . $HOME/.cargo/env
        # for Python
        [ -e $HOME/.local/venvs ] && export WORKON_HOME=$HOME/.local/venvs
        [ -f $HOME/.local/venvs/Pipfile ] && export PIPENV_PIPFILE=$HOME/.local/venvs/Pipfile # 絶対パスで指定する
        ;;
    linux*)
        [ -f $HOME/.initfile/colorrc ] && eval `dircolors $HOME/.initfile/colorrc`
        alias ls='ls --color=auto'
        alias ll='ls -l --color=auto'
        alias la='ls -la --color=auto'

        # editor
        alias emg='emacs'
        alias em='emacs -nw'
        alias E='emacsclient -t'
        alias kill-emacs="emacsclient -e '(kill-emacs)'"
        export EDITOR=vim

        [ -f /etc/profile.d/bash_completion.sh ] && source /etc/profile.d/bash_completion.sh

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

        # for Rust
        [ -f $HOME/.cargo/env ] && . $HOME/.cargo/env
        # for Python
        [ -e $HOME/.local/venvs ] && export WORKON_HOME=$HOME/.local/venvs
        [ -f $HOME/.local/venvs/Pipfile ] && export PIPENV_PIPFILE=$HOME/.local/venvs/Pipfile # 絶対パスで指定する
        ;;
    msys*)
        alias ls='ls --color=auto'
        alias ll='ls -l --color=auto'
        alias la='ls -la --color=auto'

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

        # for Golang
        export GOPATH=$XDG_DATA_HOME/go
        if [ -e $GOPATH/bin ]; then
            export PATH=$GOPATH/bin:$PATH
        fi
        ;;
esac
