#-------------------------------------------------------------
#--- Alias file for bash shells ---
#-------------------------------------------------------------
#
#  these aliases could go in the file: ~/.bashrc
#  by sourcing global definitions, they can be relocated 
#  to separate file

#------------------------------------------------------------- 
#--- Common Ones ---
#-------------------------------------------------------------
alias ls='ls -G'	# colorize output
alias lsout='ls -m'     # lists things for output file, sep by comma
# alias l='ls -CFHh'	# 'H' shows location for files with links; 'F' is unnecessary
alias l='ls -CH'        # 'C' forces multi-column output
alias ll='ls -lh'	# 'h' formats file-sizes
alias la='ls -A'	# 'A' lists all entries except for . and ..
alias lr='ls -lUh'	# 'U' lists things by when created rather than last mod
alias l1='ls -1v'	# list one file a time in a "natural order" (1,2,3...)
alias lla='ls -lArth'
# alias mv='mv -i'	# 'i' prompts for confirmation before overwriting file in destination
# alias mvo='mv -f'	# 'f' force overwrite w/o confirmation
# alias rm='rm -i'
alias cp='cp -i'
alias cpo='cp -f'
alias hy="history | head -20"
alias hgrep="history | grep"
alias cdz="cd -"	# goes back to the directory you were in before the current one
alias bcfloat="bc -l"   # bc allows for calculations, -l allows for floating point, not int math
alias duf='du -hd1'

## Make dir and change into it (-p for nested and -P to resolve symlinks)
# mkcd () {
#  mkdir -p "$1"
#  cd -P "$1"
# }
mkcd() { mkdir -p "$@" && cd "$@"; }


#-------------------------------------------------------------
# --- Commonly used dir's ---
#-------------------------------------------------------------
alias bah='cd ~/work/boozAllen/projects'

#-------------------------------------------------------------
#--- ssh ---
#-------------------------------------------------------------
alias ssh301='ssh -XYC user@path.to.system'

#--- Move everything from dir2move to this comp ---
# rsync -avz -e ssh comp_name:~/Desktop/dir2move/* .

#-------------------------------------------------------------
#--- Programs ---
#-------------------------------------------------------------
#alias xee='/Applications/Xee.app/Contents/MacOS/Xee'
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias web='open -a /Applications/Google\ Chrome.app/'

#-------------------------------------------------------------
#--- git ---
#-------------------------------------------------------------
## Syntax: maxbuff [directory]
function maxbuff() {
  if [[ -z $1 ]] ; then n='*' ; else n=$1 ; fi
  git config http.postBuffer $(du $n | sort -gr | head -1 | awk '{print $1}' -)
}
alias gpr="git pull --rebase"
# alias quickgit="git add *; git commit -m 'quick push' -a; git push origin master"
alias quickgit="git add *; git commit -m 'quick push' -a; maxbuff; git pull --rebase; git push -u origin master"
alias mastpush="maxbuff; git push -u origin master"
# alias maxgitbuff="git config http.postBuffer $(du * | sort -gr | head -1 | awk '{print $1}' -)"
# alias keeps failing, so make it into a function
# function maxgitbuff() {
#    git config http.postBuffer $(du * | sort -gr | head -1 | awk '{print $1}' -)
# }

#-------------------------------------------------------------
#--- Frequented Sites ---
#-------------------------------------------------------------
alias webat='open https://atlas.fallingstar.com/atlas/trac/wiki/CoreysBlog'	 # my wiki page with ATLAS group
alias webtol='open https://tolconnected.bah.com'

#-------------------------------------------------------------
#--- Other ---
#-------------------------------------------------------------
alias psa='ps aux | fgrep -v root'	# process status
alias ipy='ipython --pylab'	# open ipython interactive plotting
alias copypath='pwd|pbcopy'     # copy current path to clipboard, paste with command pbpaste
alias lpr='lpr -h'	# for printing
alias datenow='date "+DATE: %Y-%m-%d%nTIME: %H:%M:%S"'
alias datetime='while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &' #print the date and time in the top right corner of the shell/terminal
# alias make='make FC=gfortran'	# from JTs 301 aliases (already defined in ~/.bashrc)
## useful ref of how to: list filenamea and row# of rows with 'plt' in them, for all py files
# alias grepit='grep -EHn "plt" *.py'
# alias speedtest='curl -o /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'   # speed test
# alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

#-------------------------------------------------------------
#--- unalias --
#-------------------------------------------------------------
##  remove previously established aliases using the unalias command
##  Ex:
## alias a command 'f4'
# alias f4='cd /etc/'
## remove alias set for command 'f4'
# unalias f4
