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
export LSCOLORS=gxfxcxdxbxegedabagacad
case "${OSTYPE}" in
    darwin*)
        alias ls='ls -FG'
        alias ll='ls -alFG'
        alias la="ls -laG"
        if [ -f `brew --prefix`/etc/bash_completion ]; then
            source `brew --prefix`/etc/bash_completion
        fi
        export JAVA_HOME=`/usr/libexec/java_home -v 1.8` #java8が使いたいとき
        #export GRADLE_HOME=$(brew info gradle | grep /usr/local/Cellar/gradle | awk '{print $1}')
        export GRADLE_HOME=/usr/local/Cellar/gradle/5.4
        export PATH=$HOME/.nodebrew/current/bin:$PATH
        ;;
    linux*)
        alias ls='ls --color'
        alias ll='ls -l --color'
        alias la='ls -la --color'
        if [ -f /etc/profile.d/bash_completion.sh ]; then
            source /etc/profile.d/bash_completion.sh
        fi
        if [ -e /usr/local/bin/vim ]; then
            alias vim='/usr/local/bin/vim'
            alias vi='/usr/local/bin/vim'
        fi
        if [ -e $HOME/.rbenv/bin ]; then
            export PATH=$PATH:$HOME/.rbenv/bin:$PATH
            eval "$(rbenv init -)"
        fi
        ;;
    msys*)
        alias ls='ls --color'
        alias ll='ls -l --color'
        alias la='ls -la --color'
        ;;
esac

which col &> /dev/null; RETURN_CODE=$?
if [ -e /bin/sh ] && [ $RETURN_CODE = 0 ]; then
    export MANPAGER="/bin/sh -c \"col -b -x|vim -R -c 'set ft=man nolist nonu noma' -\""
fi

function _compreply_ssh() {
  COMPREPLY=(`cat ~/.ssh/config* | grep -e '^Host' | cut -d " " -f 2 | grep -E "$2"`)
}
complete -F _compreply_ssh ssh

