# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;; *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias gm='/google/data/ro/projects/gaiamint/bin/get_mint --type=loas --text --endusercreds --scopes=35200 --out=/tmp/cwx.txt'
alias sc='stubby call /bns/sa/borg/sa/bns/travel-assistant/destination-explore-nightly.frontend.serve/0 TravelService.GetTravelLocation --proto2'
alias scc='stubby call /bns/sa/borg/sa/bns/travel-assistant/destination-explore-nightly.frontend.serve/0 TravelService.GetTravelLocationCollection --proto2'
alias rlcolab='/google/data/ro/projects/quality/ranklab/tools/rl_colab.par'
alias rlcolab='/google/data/ro/projects/quality/ranklab/tools/rl_colab.par'
alias synctogreen='testing/tap/scripts/tap_sync.sh superroot,superroot.opt,superroot.data,gws.googledata,gws.binary_and_data,gws,gws.plugins.java
'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gy='git5 sync'
alias cpplint='/home/build/google3/devtools/cpplint/cpplint.py'
alias gmock='/home/build/nonconf/google3/third_party/gmock/scripts/generator/gmock_gen.py'
alias zapfhahn_presubmit='/google/data/ro/teams/zapfhahn/presubmit/zapfhahn_presubmit.par'
alias cl='srcfs get_readonly'
alias blazec='zapfhahn_presubmit --alsologtostderr --changelist='
alias jc='/home/build/static/projects/jobcontroller/jc'
alias prodjc='jc --jobcontroller_server_bns=/bns/iy/borg/iy/bns/travel-assistant/jobcontroller/0:jc --borguser=travel-assistant'
alias myjc='jc --jobcontroller_server_bns=/bns/iy/borg/iy/bns/wenxuancai/jobcontroller/0:jc'
alias runsrcl='/google/data/ro/projects/superroot/spiffy'
alias runspiffy='/google/data/ro/projects/superroot/spiffy --run_spiffy'
alias runbenchmark='/google/data/ro/projects/superroot/spiffy --run_benchmark'
alias rmclient='p4 citc -d -f'
alias buildgsrstubby='blaze build -c opt knowledge/server/tools/gsr_stubby'
alias sits='cd superroot/impls/travel/service'
alias cwx='cd experimental/users/wenxuancai'
alias jeev='cd experimental/travel_assistant/jeeves'
alias tkefi='cd superroot/impls/knowledge/kefi/extractor/travel'
alias cb='cd production/borg/travel-assistant/tg'
alias jcborg='borgcfg production/borg/travel-assistant/iy/jobcontroller_dev.borg'
alias bs='blaze build suggest/completeserver:local_completeserver'
alias rs='./blaze-bin/suggest/completeserver/run_completeserver --cell_dir=jg-dev'
alias ih='devtools/maintenance/include_what_you_use/iwyu.py --checkout_command="g4 edit"'
alias rh='devtools/maintenance/include_what_you_use/iwyu.py --checkout_command="g4 edit" --nosafe_headers'
alias bqr='blaze build -c opt --config=insecure //quality/qrewrite'
alias rsb='borgcfg production/borg/suggest/pb-dev/suggest.borg --vars=user=$USER,use_dev_completeserver=true,priority=25,prefix=cwx,cs_suffix=,dc=jg reload --skip_confirmation'
alias gooru=/google/data/ro/teams/ke-tools/gooru
alias syncsr='/google/data/ro/projects/testing/tap/scripts/tap_sync superroot,superroot.opt'
SRCR='production/borg/superroot/release/superroot-current.borg'
TGR='quality/views/extraction/relationships/schema/data/i18n/schema_travel.en.txt'
TSM='quality/views/extraction/relationships/schema/data/attribute_schema_travel.txt'
GWSRC='--blazerc=/google/src/head/depot/google3/gws/tools/blazerc'
EBBG='production/borg/travel-assistant/iy/entities_builder.borg'
NBG='production/borg/travel-assistant/tg/destination_explore_nightly.borg'
SKF='experimental/travel_assistant/start_kerouac_frontends.sh'
alias mpmsr='mpm pi travel/assistant/superroot'
SB1='destination-explore-wenxuancai'
SB2='destination-explore-wenxuancai-nightly'
SBS1='/bns/tg/borg/tg/bns/travel-assistant/destination-explore-wenxuancai.frontend.serve/0'
SBS2='/bns/tg/borg/tg/bns/travel-assistant/destination-explore-wenxuancai-nightly.frontend.serve/0'
NL='/bns/tg/borg/tg/bns/travel-assistant/destination-explore-nightly.frontend.serve/0'
X20='/google/data/ro/users/we/wenxuancai/www'
alias sfs='stubby call --proto2 blade:travel-flights-server-parent FlightSearchService.GetTravelDestinationPrices'


export PATH="$HOME/bin:$PATH"
# Crow (Android emulator)
source /google/data/ro/teams/mobile_eng_prod/crow/crow-complete.bash
alias crow=/google/data/ro/teams/mobile_eng_prod/crow/crow.par

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
#sources / etc / bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export JOBCONTROLLER_SERVER_BNS='/bns/iy/borg/iy/bns/wenxuancai/jobcontroller/0:jc'


git() { if [[ $1 == 'merge' ]]; then echo 'Use git5 merge, not git merge. git merge does not understand how to merge the READONLY link and it can corrupt your branch, so stay away from it.  type "unset -f git" to remove this warning'; else command git "$@"; fi; }

function swap()
{
  local TMPFILE=tmp.$$
  mv "$1" $TMPFILE
  mv "$2" "$1"
  mv $TMPFILE "$2"
}
