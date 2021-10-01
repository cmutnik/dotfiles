#-------------------------------------------------------------
#--- Paths ---
#-------------------------------------------------------------
## add bin to path for generated scripts (object files):
## then toss in the path for monsta and mongo
export MANPATH=/Users/cmutnik/man:/Users/cmutnik/man/man1:$MANPATH
export PATH=/Users/cmutnik/bin:/Users/cmutnik/codes/monsta/bin:$PATH
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

export EDITOR=emacs

## follow the `monsta man` page to setup the param file:
# export MONGOPAR=~/codes/monsta/lib/monsta/mongo.params:${MONGOPAR}

# from ay301, when ipython couldn't find a particular package
## Gatspy (coudn't figure out how to do this in a smarter way)
# export PYTHONPATH=/usr/local/lib/python2.7/dist-packages:/$PYTHONPATH

## gnuplot encoding
# export LC_CTYPE=en_US.UTF-8


ulimit -S -c 0      # Don't want coredumps.


## don't put duplicate lines or lines starting with space in the history.
## See bash(1) for more options
HISTCONTROL=ignoreboth

## append to the history file, don't overwrite it
shopt -s histappend

## for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000


##-------------------------------------------------------------
##--- Aliases ---
##-------------------------------------------------------------
# alias make='make FC=gfortran'	# from JTs 301 aliases
## check specified file for other aliases:
##  ~/.bash_aliases
if [ -f ~/.bash_make_ISItWANTED_in_aliases ]; then
      . ~/.bash_make_ISItWANTED_in_aliases   # --> Read ~/.bash_aliases, if present.
fi


#-------------------------------------------------------------
#--- Source global definitions (if any) ---
#-------------------------------------------------------------
if [ -f ~/.bash_aliases ]; then
      . ~/.bash_aliases   # --> Read ~/.bash_aliases, if present.
fi
# Another way to source would be by uncommenting lines below
#source ~/.bash_aliases

# Source file containing bash functions
if [ -f ~/.bash_functions ]; then
      . ~/.bash_functions   # --> Read ~/.bash_functions
fi


#-------------------------------------------------------------
#--- Functions ---
#-------------------------------------------------------------
# Syntax: tjdate TJD    e.g.  tjdate 5228  => 20100201
function tjdate() {
  tjsec=`awk -v tjd=$1 'BEGIN{printf "%.3f", (tjd+9413)*86400}'`
  date -u -d "1970-01-01 $tjsec sec" +%Y%m%d
}

# Syntax: tjd year month day e.g. tjd 2010 02 01   => 5228
function tjd() {
  echo $1 $2 $3 | awk '{printf "%d\n", 367*$1+$3-728987+int(275.0*$2/9.0)-int(7\
.0*($1+int(($2+9.0)/12.0))/4.0)}'
}

# Syntax: datetjd date    e.g.  datetjd 20100201   => 5228
function datetjd() {
  echo `date -u -d $1 "+%s"` | awk '{printf "%d\n",$1/86400.0-9413.0}'
}

# Syntax: mjdnow [+n_day]
function mjdnow() {
  if [[ -z $1 ]] ; then n=0 ; else n=$1 ; fi
  echo $(date -u "+%s") | awk -v n=$n '{printf "%d\n",$1/86400.0+n+40587.0}'
}


#-------------------------------------------------------------
#--- EXAMPLES ---
#-------------------------------------------------------------

## of how to add to PATH:
# cd
# cp /other/dir/ayls.f .
# make ayls
# echo $PATH
# export PATH=$PATH:~/bin
# echo $PATH
# mkdir bin
# mv ayls bin
# which ayls
# ayls
