#-------------------------------------------------------------
#--- Source bashrc file ---
#-------------------------------------------------------------
# source ~/.bashrc   # --> Read ~/.bashrc
if [ -f ~/.bashrc ]; then
      . ~/.bashrc   # --> Read ~/.bashrc, if present.
fi

#-------------------------------------------------------------
#--- ipython ---
#-------------------------------------------------------------
## needed to run ipython from bash, nomatter what dir you are in
ur_setup() {
    eval `/Users/cmutnik/.ureka/ur_setup -sh $*`
}
ur_forget() {
    eval `/Users/cmutnik/.ureka/ur_forget -sh $*`
}
ur_setup

#-------------------------------------------------------------
#--- Personalize Prompt ---
#-------------------------------------------------------------
#--- Modify Displayed Info --- 
# export PS1="\u@\h:\w$ "   # lowercase w for full paths
export PS1="\u@\h:\W$ "

##--- Color Terminal ---
# alias ls='ls -GFh'	# aliased in ~/.bash_aliases so other aliases use it
## above is the only line needed
##--- Other Methods ---
# export CLICOLOR=1	# only needed line
##--- Personalize Colors ---
# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# export LSCOLORS=ExFxBxDxCxegedabagacad
# export LSCOLORS=GxFxCxDxBxegedabagaced # another color option...

#-------------------------------------------------------------
#--- conda initialize ---
#-------------------------------------------------------------

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/cmutnik/codes/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/cmutnik/codes/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/cmutnik/codes/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/cmutnik/codes/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

