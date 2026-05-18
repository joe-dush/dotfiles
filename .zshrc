setopt vi

export PATH="/opt/homebrew/opt/curl/bin:$PATH"

. "$HOME/.local/bin/env"


# ---
# tab completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# ---
# differentiating between prompt and output
autoload -U colors && colors
PS1="%{$fg[cyan]%}%~%{$reset_color%} %# "

# --
# aliases
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude .gitkeep'
alias tree="tree -I '.git|.venv|venv|*.pyc'"

alias fzfc='code $(fzf)'
alias fzfv='vim $(fzf)'

alias note='${EDITOR:-vim} "$HOME/notes/$(date +%Y%m%d).md"'
alias note-latest='${EDITOR:-vim} "$HOME/notes/$(ls -1 $HOME/notes/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].md 2>/dev/null | sort | tail -n 1 | xargs -n1 basename)"'
alias note-search-headings='f() { rg -i "^\#+\s.*$1" ~/notes --type md; }; f'
