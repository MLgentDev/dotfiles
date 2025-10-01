# Set up the prompt
# autoload -Uz promptinit
# promptinit
# prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Set Zsh as the default shell
export SHELL=/bin/zsh

BREW_PATH="/home/linuxbrew/.linuxbrew/bin/brew"
if [[ -x "$BREW_PATH" ]]; then
  eval "$($BREW_PATH shellenv)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Load fnm (Fast Node Manager) if installed
FNM_PATH="${HOME}/.local/share/fnm"
if [ -d "${HOME}/.local/share/fnm" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env)"
fi

# Load nvm (Node Version Manager) if installed
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

# Zellij integration
if [[ -n $ZELLIJ ]]; then
  autoload -Uz add-zsh-hook

  _zj_pane_update() {
    print -nP $'\e]2;'${USER}@${HOST}': '%~$'\a'
  }

  # Update on directory change
  add-zsh-hook chpwd _zj_pane_update

  # Set once at startup so the first prompt already has the right title
  _zj_pane_update
fi

# Starship prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# fzf
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi

# uv
if command -v uv >/dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
fi
if command -v uvx >/dev/null 2>&1; then
  eval "$(uvx --generate-shell-completion zsh)"
fi

# just
if command -v just >/dev/null 2>&1; then
  eval "$(just --completions zsh)"
fi

# dotnet
if command -v dotnet >/dev/null 2>&1; then
  # zsh parameter completion for the dotnet CLI
  _dotnet_zsh_complete()
  {
    local completions=("$(dotnet complete "$words")")

    # If the completion list is empty, just continue with filename selection
    if [ -z "$completions" ]
    then
      _arguments '*::arguments: _normal'
      return
    fi

    # This is not a variable assignment, don't remove spaces!
    _values = "${(ps:\n:)completions}"
  }

  compdef _dotnet_zsh_complete dotnet
fi

### Zinit (Zsh plugin manager)
if [[ -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
  autoload -Uz _zinit
  (( ${+_comps} )) && _comps[zinit]=_zinit


  # Extra completions (must be before compinit)
  zinit ice wait lucid blockf
  zinit light zsh-users/zsh-completions

  # Initialize completion via zinit and replay any early compdefs
  zicompinit
  zicdreplay

  # --- fzf-tab hooks the completion UI (AFTER compinit) ---
  zinit light Aloxaf/fzf-tab

  # suggestions and syntax highlighting
  zinit light zsh-users/zsh-autosuggestions
  zinit light zsh-users/zsh-syntax-highlighting

  bindkey '^ ' autosuggest-accept
fi
### End of Zinit

# Completion system setup
# autoload -Uz compinit
# compinit

# Completion configuration
# zmodload zsh/complist
# zstyle ':completion:*' menu select=2
# fzf-tab replaces the menu UI:
zstyle ':completion:*' menu no

# Presentation / descriptions
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose true
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

# Matching behavior
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=* l:|=*'

# Colors
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Legacy system off
zstyle ':completion:*' use-compctl false

# Extra: nicer `kill` menu coloring
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

