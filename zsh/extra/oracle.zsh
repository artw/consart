#!/usb/bin/env zsh
# Oracle Database stuff
# to use this, set ORACLE_HOME_DB and/or ORACLE_HOME_GRID and
# source ~/.consart/zsh/extra/oracle.zsh
# in zshrc.local

# environment
if [[ -d $ORACLE_HOME_DB || -d $ORACLE_HOME_GRID ]]; then
  if [[ -d $ORACLE_HOME_GRID ]]; then
    export ORACLE_HOME=$ORACLE_HOME_GRID
    path+=${ORACLE_HOME_GRID}/bin
  fi
  if [[ -d $ORACLE_HOME_DB ]]; then
    export ORACLE_HOME=$ORACLE_HOME_DB
    path+=${ORACLE_HOME_DB}/bin
  fi
  export NLS_DATE_FORMAT="dd-mm-yy hh24:mi:ss"
fi

# aliases 
if `which rlwrap 1>/dev/null` ; then
  alias sqlplus="rlwrap sqlplus"
  alias sql="rlwrap sqlplus / as sysdba"
  alias rman="rlwrap rman"
  alias asmcmd="rlwrap asmcmd"
fi

# functions
function ora {
  # prepares the shell for oracle stuff

  if [[ -z $ORACLE_HOME_DB && -z $ORACLE_HOME_GRID ]]; then
    echo "you must set ORACLE_HOME_DB or ORACLE_HOME_GRID in your zshrc.local"
    return 1
  fi

  if [[ -z $1 ]] || [[ ! $1 == 'db' && ! $1 == 'grid' ]]; then
    echo "usage: $0 <db|grid>"
    return 1
  fi

  if [[ $1 == 'db' && -d $ORACLE_HOME_DB ]]; then
    export ORACLE_HOME=$ORACLE_HOME_DB
    export PATH=${ORACLE_HOME}/bin:${PATH}
  fi

  if [[ $1 == 'grid' && -d $ORACLE_HOME_GRID ]]; then
    export ORACLE_HOME=$ORACLE_HOME_GRID
    export PATH=${ORACLE_HOME}/bin:${PATH}
  fi
  export NLS_DATE_FORMAT="dd-mm-yy hh24:mi:ss"
  echo "ORACLE_HOME set to $ORACLE_HOME"
  return 0
}

function sid {
  # sets the ORACLE_SID
  if iscmd sqlplus; then
    if [ -z $1 ]; then
      if [ ! -z $ORACLE_SID ]; then
        echo "ORACLE_SID=$ORACLE_SID"
        return 0
      fi
      echo "sets ORACLE_SID"
      echo "usage: $0 <sid>"
      # for prompt
      rprompt_extra(oracle_sid '')
      return 1
    else
      export ORACLE_SID=$1
      # for prompt
      rprompt_extra=(oracle_sid "%B%F{red}[%f${ORACLE_SID}%F{red}]%f%b ")
      return 0
    fi
  else 
    echo "no sqlplus in PATH, was ORACLE_HOME set correctly?"
    return 1
  fi
}
