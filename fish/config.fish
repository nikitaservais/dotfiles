set -gx EDITOR hx

zoxide init fish | source
starship init fish | source

alias cd="z"
alias cat="bat"
alias ls="eza"
alias ll="ls -l"
alias lll="ls -la"
alias lt="ls -T"


set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/nikita/.ghcup/bin $PATH # ghcup-env
