if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export RANGER_LOAD_DEFAULT_RC=FALSE

# tomcat stuff
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export CATALINA_HOME=/home/stefano/tomcat
export EDITOR=vim
export BROWSER=firefox-developer-edition
export XDG_CURRENT_DESKTOP=Unity

[[ $- != *i* ]] && return
