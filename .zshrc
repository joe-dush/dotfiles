setopt vi

export PATH="/opt/homebrew/opt/curl/bin:$PATH"

. "$HOME/.local/bin/env"


# ---
# tab completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# ---
# prompt
autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b%u%c '
zstyle ':vcs_info:git:*' actionformats '...'
zstyle ':vcs_info:git:*' unstagedstr '*'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:*:*' check-for-changes true
setopt PROMPT_SUBST
PROMPT='%F{cyan}%~ %#%f '
RPROMPT='%F{cyan}${vcs_info_msg_0_}%f'

# --
# aliases
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude .gitkeep'
alias tree='tree -I ".git|.venv|venv|__pycache__"'

alias fzfc='code $(fzf)'
alias fzfv='vim $(fzf)'

alias rack='bash ~/.local/share/Rack2/Rack2_executable/run_rack_using_pwjack.sh'

alias note='${EDITOR:-vim} "$HOME/notes/$(date +%Y%m%d).md"'
alias note-latest='${EDITOR:-vim} "$HOME/notes/$(ls -1 $HOME/notes/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].md 2>/dev/null | sort | tail -n 1 | xargs -n1 basename)"'
alias note-search-headings='f() { rg -i "^\#+\s.*$1" ~/notes --type md; }; f'
