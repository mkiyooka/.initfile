# default:cyan / root:red
if [ $UID -eq 0 ]; then
    PS1="[\[\033[31m\]\u@\h\[\033[00m\] \[\033[32m\]\W\[\033[00m\]]> "
else
    PS1="[\[\033[36m\]\u@\h\[\033[00m\] \[\033[32m\]\W\[\033[00m\]]\\$ "
    #PS1="[\u@\h \W]\\$ "
fi

export GRADLE_HOME=$(brew info gradle | grep /usr/local/Cellar/gradle | awk '{print $1}')

# "-F":ディレクトリに"/"を表示 / "-G"でディレクトリを色表示
export LSCOLORS=gxfxcxdxbxegedabagacad
case "${OSTYPE}" in darwin*)
  alias ls='ls -FG'
  alias ll='ls -alFG'
  alias la="ls -laG"
  ;;
linux*)
  alias ls='ls --color'
  alias ll='ls -l --color'
  alias la='ls -la --color'
  ;;
esac

case "${OSTYPE}" in darwin*)
  alias gvim='/Applications/MacVim.app/Contents/bin/gvim'
  alias vim='/Applications/MacVim.app/Contents/bin/vim'
  alias vi='/Applications/MacVim.app/Contents/bin/vim'
  ;;
linux*)
  ;;
esac

alias e='emacs'

export JAVA_HOME=`/usr/libexec/java_home -v 1.8` #java8が使いたいとき

alias dj='docker run --rm --mount type=bind,src=$PWD,dst=/home/docker --workdir /home/docker openjdk:11 java'
alias djc='docker run --rm --mount type=bind,src=$PWD,dst=/home/docker --workdir /home/docker openjdk:11 javac'
alias djd='docker run --rm --mount type=bind,src=$PWD,dst=/home/docker --workdir /home/docker openjdk:11 javadoc'

alias dg='docker run --rm -v "$PWD":/home/gradle/project -v "$PWD/.gradle":/root/.gradle -w /home/gradle/project gradle gradle'
alias dgj='docker run --rm -v "$PWD":/home/gradle/project -w /home/gradle/project gradle java'
alias dgjc='docker run --rm -v "$PWD":/home/gradle/project -w /home/gradle/project gradle javac'
alias dgjd='docker run --rm -v "$PWD":/home/gradle/project -w /home/gradle/project gradle javadoc'

alias dtom='docker container run --rm --name tomcat-example -p 80:8080 -v "$PWD:/usr/local/tomcat/webapps" tomcat'
alias dubu='docker run -it --rm -v "$PWD:/root" -w "/root" ubuntu:18.04'
