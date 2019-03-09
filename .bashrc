# default:cyan / root:red
if [ $UID -eq 0 ]; then
    PS1="[\[\033[31m\]\u@\h\[\033[00m\] \[\033[01m\]\W\[\033[00m\]]\\$ "
else
    PS1="[\u@\h \W]\\$ "
    #PS1="[\[\033[36m\]\u@\h\[\033[00m\] \[\033[01m\]\W\[\033[00m\]]\\$ "
fi

# "-F":ディレクトリに"/"を表示 / "-G"でディレクトリを色表示
alias ls='ls -FG'
alias ll='ls -alFG'

export JAVA_HOME=`/usr/libexec/java_home -v 1.8` #java8が使いたいとき

alias dj='docker run --rm --mount type=bind,src=$PWD,dst=/home/docker --workdir /home/docker openjdk:11 java'
alias djc='docker run --rm --mount type=bind,src=$PWD,dst=/home/docker --workdir /home/docker openjdk:11 javac'
