setopt vi

# ---
# work only
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# allows me to run `aws sso login` without the --profile flag
# For made tech aws sandbox access via cli
export AWS_PROFILE=mt-playground

#. "$HOME/.local/bin/env"


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
RPROMPT='%F{242}%D{%H:%M:%S} %F{cyan}${vcs_info_msg_0_}%f'

# --
# aliases
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git --exclude .gitkeep'
alias tree='tree -I ".git|.venv|venv|__pycache__"'

src() {
  local rel_dir full_dir
  rel_dir=$(cd ~/src && find . -mindepth 1 -maxdepth 4 -type d -not -path '*/.*' | sed 's|^\./||' | fzf --height 40% --layout=reverse) && \
  full_dir="$HOME/src/$rel_dir" && \
  cd "$full_dir" && code .
}

his() {
  local selected_command
  selected_command=$(fc -rl 1 | awk '{$1=""; print $0}' | sed 's/^[ \t]*//' | fzf --tiebreak=index --no-sort --height 40% --reverse)
  if [[ -n "$selected_command" ]]; then
    print -z "$selected_command"
 #    eval "$selected_command"     # Execute immediately
  fi
}

alias tab='chrome-tab-activate'

alias fdiff="uv tool run ruff format && uv tool run ruff check --fix; git diff"
alias ctest="clear && uv run pytest"

alias rack='bash ~/.local/share/Rack2/Rack2_executable/run_rack_using_pwjack.sh'

alias note='${EDITOR:-vim} "$HOME/notes/$(date +%Y%m%d).md"'
alias note-latest='${EDITOR:-vim} "$HOME/notes/$(ls -1 $HOME/notes/[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9].md 2>/dev/null | sort | tail -n 1 | xargs -n1 basename)"'
alias note-search-headings='f() { rg -i "^\#+\s.*$1" ~/notes --type md; }; f'
