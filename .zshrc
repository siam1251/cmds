# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PYTHONPATH="$PYTHONPATH:$HOME/build/models-master:$HOME/build/models-master/research:$HOME/build/models-master/research/slim"
# Path to your oh-my-zsh installation.
  export ZSH=/home/sayem/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="truesell"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh

# User configuration

 export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="mate ~/.zshrc"
 alias ohmyzsh="mate ~/.oh-my-zsh"

 
 plugins=(
  git
  bundler
  dotenv
  osx
  rake
  rbenv
  ruby
)
ZSH_THEME="agnoster"

#export PYTHONPATH=$PYTHONPATH:/home/sayem/anaconda3/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/tmp/OpenBLAS

export http_proxy=http://localhost:3128
export https_proxy=http://localhost:3128
export no_proxy=localhost,.hwap,.huawei.com

export HTTP_PROXY=http://localhost:3128
export HTTPS_PROXY=http://localhost:3128
export NO_PROXY=localhost,.hwap,.huawei.com

#unset HTTP_PROXY
#unset HTTPS_PROXY
#unset http_proxy
#unset https_proxy

version=17c
export NDK=/home/sayem/build/NDK/android-ndk-r${version}
export ANDROID_NDK=/home/sayem/build/NDK/android-ndk-r${version}
export ADB=/home/sayem/Android/Sdk/platform-tools/adb
export SDK=/home/sayem/Android/Sdk/
export adb=/home/sayem/Android/Sdk/platform-tools/adb
export PATH=$PATH:$NDK:/home/sayem/build/android-studio/bin/studio.sh:/home/sayem/Android/Sdk/platform-tools/

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/
#export PATH=$PATH:/home/sayem/anaconda3/bin
export PATH=$PATH:/home/sayem/build/android-studio/bin
export PATH=$PATH:/home/sayem/anaconda3/lib
#export PATH=$PATH:/home/sayem/anaconda3/bin
export PATH=$PATH:/home/sayem/anaconda3/include
export LD_LIBRAY_PATH=$LD_LIBRARY_PATH:/home/sayem/anaconda3/lib
#export PATH=$PATH:/home/sayem/build/cmake/cmake-3.12.3-Linux-x86_64/bin

#export PATH=$PATH:/home/sayem/build/git-rectify/git-2.7.4

export TF="/home/sayem/build/tensorflow-master"

export TF_S=$TF/bazel-bin/tensorflow/tools/graph_transforms/summarize_graph

export TF_NPU="/home/sayem/code/HiAI_DDK_100.200.010.010/tools"
alias sshb='ssh bharath@10.193.97.72'
alias tf_s='$TF/bazel-bin/tensorflow/tools/graph_transforms/summarize_graph'
alias cloud='"/usr/local/HDPClient/LinuxClient/CloudClient.sh"> /dev/null 2>&1'
alias espace='wine "/home/sayem/.wine/drive_c/Program Files (x86)/eSpace_Desktop/eSpace.exe"> /dev/null 2>&1'

export cmds='/home/sayem/cmds'

#export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

export b='bharath@10.193.97.72'
export j='bharathi@10.193.97.72'
export b='bharath@10.193.97.72'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sayem/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sayem/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sayem/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sayem/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

prompt_context () { }
#[ $TERM != "screen" ]] && exec tmux

export utest='FaceDetectionAndTracking/Unittest/Bin/Unittest'
export wine_home='/home/sayem/.wine/drive_c/users/sayem'
export dst="/home/sayem/code/gestureapp/app/libs/arm64-v8a/"
export src="/home/sayem/code/FaceEngine/build/FaceDetectionAndTracking/VideoAnalysisEngine/libVideoAnalysisEngine.so"
alias xcp="xclip -sel clip" 
alias adb_r="adb kill-server&&adb start-server" 
