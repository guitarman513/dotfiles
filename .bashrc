alias ls="ls -alhN --color=auto --group-directories-first"
alias eb="vi ~/.config/.bashrc"

export PROMPT_DIRTRIM=3
_GREEN=$(tput setaf 2)
_BLUE=$(tput setaf 4)
_RED=$(tput setaf 1)
_YELLOW=$(tput setaf 3)
_RESET=$(tput sgr0)
_BOLD=$(tput bold)
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
  PS1="${_VENV_ENV}$(_CONDA_ENV}${_YELLOW}${_BRANCH}${_GREEN}\u${_RED}@${_BLUE}\w${_RESET} ${_BOLD}\$ ${_RESET}"
}

  PROMPT_COMMAND="upadate_ps1"
