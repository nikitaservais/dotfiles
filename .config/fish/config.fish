set -gx EDITOR hx

zoxide init --cmd cd fish | source
starship init fish | source
zellij setup --generate-completion fish | source

alias cat="bat"
alias ls="eza"
alias ll="ls -l"
alias lll="ls -la"
alias lt="ls -T"

alias ghcs="gh copilot suggest"
alias ghce="gh copilot explain"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /Users/nikita/.ghcup/bin $PATH # ghcup-env

# Created by `pipx` on 2024-07-16 17:06:38
set PATH $PATH /Users/nikita/.local/bin
# enable_transience
