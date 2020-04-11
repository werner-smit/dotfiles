ZSH_THEME_GIT_PROMPT_PREFIX="|%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}⚡"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_VIRTUALENV_PREFIX="%{$fg[magenta]%}[%{$reset_color%}%{$fg[yellow]%}"
ZSH_THEME_VIRTUALENV_SUFFIX="%{$reset_color%}%{$fg[magenta]%}]%{$reset_color%}"

TIMER_FORMAT='[%d] '; 
TIMER_PRECISION=2 
TIMER_MOVE_DISTANCE=0

function prompt_char {
	if [ $UID -eq 0 ]; then echo "%{$fg[red]%}#%{$reset_color%}"; else echo "%{$fg[cyan]%}⇒%{$reset_color%}"; fi
}

function exec_status_prompt {
    duration_str=$(__timer_get_duration_str)
    if ! [ -z $duration_str ]; then
        local cols=$((COLUMNS - ${#duration_str} - 1))
        echo -en "\033[0E\033[${cols}C ${duration_str}"
    fi
}

PROMPT='%(?, ,%{$fg[red]%}FAIL: $?%{$reset_color%}) %{$fg[cyan]%}$(exec_status_prompt)%{$reset_color%}
%{$fg[magenta]%}%n%{$reset_color%}%{$fg[cyan]%}@%{$reset_color%}%{$fg[yellow]%}%m%{$reset_color%}:%{$fg[cyan]%}%~%{$reset_color%}$(git_prompt_info)$(virtualenv_prompt_info)
%_$(prompt_char) '

RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'
