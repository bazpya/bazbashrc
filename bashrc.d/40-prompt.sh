baz_set_prompt() {
    # \[...\] tells bash these bytes take up no screen width
    local pink='\[\e[95m\]' red='\[\e[91m\]' cyan='\[\e[96m\]'
    local blue='\[\e[94m\]' yellow='\[\e[93m\]' reset='\[\e[0m\]'

    export PS1="\n${pink}\u${red}@${cyan}\h\n${blue}\w${yellow}\$ ${reset}"
}

PROMPT_COMMAND=baz_set_prompt
