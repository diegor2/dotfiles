# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export ANDROID_HOME="/home/druggeri/Android/Sdk"
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/tools/proguard/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

LATEST_BUILD_TOOLS=$(ls $ANDROID_HOME/build-tools/ | sort -gr | head -1)
export PATH=$ANDROID_HOME/build-tools/$LATEST_BUILD_TOOLS:$PATH

export ANDROID_HVPROTO=ddm

#export JAVA_HOME=/usr/lib/jvm/default-java
export JAVA_HOME=/usr/lib/jvm/java-15-openjdk-amd64/
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export PATH=$JAVA_HOME/bin:$PATH

alias xclip="xclip -selection clipboard"
alias grep="grep --color=always"
alias xargs="xargs -d '\n'"
alias rsync="rsync -avhzP"

export _UNZIP=$(which unzip)
function unzip() {
    for f in $(ls $@); do
        ${_UNZIP} -o $f -d ${f/\.zip//}
    done
}

function ada() {

    if [[ "-p" == "$1" ]]
    then
        shift
	parallel=1
    else
        parallel=0
    fi
    for d in $(adb devices | sed -e '1d;s/device//g'); do
	if [ $parallel -eq 1 ]
	then
            adb -s $d $@ &
	else
            adb -s $d $@
	fi
    done
}

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

numlockx on

xrdb -merge ~/.Xresources

export TERMINAL=guake #rxvt-unicode

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/pulse
export LD_PRELOAD=/usr/local/lib/camlink/camlink.so

#export PATH=/home/druggeri/Android/Sdk/ndk/21.0.6113669:/home/druggeri/bin/android-studio/jre/bin:/home/druggeri/Android/Sdk/build-tools/29.0.2:/home/druggeri/Android/Sdk/platform-tools:/home/druggeri/Android/Sdk/tools/proguard/bin:/home/druggeri/Android/Sdk/tools/bin:/home/druggeri/Android/Sdk/tools:/home/druggeri/bin:/home/druggeri/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

