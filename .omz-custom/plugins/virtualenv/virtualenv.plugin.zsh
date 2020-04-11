function virtualenv_prompt_info(){
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}:$(pyversion)${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}

function pyversion(){
    pyversion=$(python -V 2>&1 | tr '\n' ' ' | cut -d" " -f2)
    echo $pyversion
}

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1
