alias ls="ls -alhN --color=auto --group-directories-first"
alias eb="vi ~/.config/.bashrc"

export PROMPT_DIRTRIM=3

# non-printable characters such as these color formatters should apparantly be 
# wrapped with \[ and \]
# but, sometimes \001 and \002 work instead 

_A="\001"
_P="\002"

_GREEN="$_A$(tput setaf 2)$_P"
_BLUE="$_A$(tput setaf 4)$_P"
_RED="$_A$(tput setaf 1)$_P"
_YELLOW="$_A$(tput setaf 3)$_P"
_RESET="$_A$(tput sgr0)$_P"
_BOLD="$_A$(tput bold)$_P"
function update_ps1 {
  local _BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
  local _CONDA_ENV=""
  if [ -n "$CONDA_DEFAULT_ENV" ]
  then
    _CONDA_ENV="($CONDA_DEFAULT_ENV)"
  else
    _CONDA_ENV=""
  fi

  if [ -n "$VIRTUAL_ENV_PROMPT" ]
  then
    _VENV_ENV="$VIRTUAL_ENV_PROMPT"
  else
    _VENV_ENV=""
  fi

  PS1="${_VENV_ENV}${_CONDA_ENV}"         # add venv/conda env, uncolored
  PS1+="$_YELLOW${_BRANCH}"               # add yellow git branch
  PS1+="$_GREEN\u"                        # user in green
  PS1+="$_RED@"                           # red at sign
  PS1+="$_BLUE\w"                         # blue directories
  PS1+="$_RESET $_BOLD\$ $_RESET"         # add an uncolored bold dollar sign after a space, then remove the bold 
}

  PROMPT_COMMAND="upadate_ps1"
