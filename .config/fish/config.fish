set -gx EDITOR hx
set -Ux SUDO_EDITOR hx

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

set -x TERM xterm-color
set -x COLORTERM truecolor
# Created by `pipx` on 2024-07-16 17:06:38
set PATH $PATH /Users/nikita/.local/bin

# homebrew
set -Ux HOMEBREW_CACHE ~/.homebrew/cache
set -Ux HOMEBREW_TEMP ~/.homebrew/temp

# TODO: refactor to nix writeShellScriptBin
set -l local_bin $HOME/.local/bin
fish_add_path $local_bin
if not test -f $local_bin/yz-fp
    mkdir -p $local_bin
    printf '#!/bin/sh\nzellij action toggle-floating-panes\nzellij action write 27\nfor selected_file in "$@"\ndo\n    zellij action write-chars ":open $selected_file"\n    zellij action write 13\ndone\nzellij action toggle-floating-panes\nzellij action close-pane\n' >$local_bin/yz-fp
    chmod +x $local_bin/yz-fp
end
if not test -f $local_bin/floating-yazi
    mkdir -p $local_bin
    printf '#!/bin/sh\nzellij run -c -f --width 80%% --height 80%% -x 10%% -y 10%% -- yazi "$PWD"\n' >$local_bin/floating-yazi
    chmod +x $local_bin/floating-yazi
end
if not test -f $local_bin/floating-lazygit
    mkdir -p $local_bin
    printf '#!/bin/sh\nzellij run -c -f --width 95%% --height 95%% -x 2%% -y 2%% -- lazygit\n' >$local_bin/floating-lazygit
    chmod +x $local_bin/floating-lazygit
end
if not test -f $local_bin/floating-serpl
    mkdir -p $local_bin
    printf '#!/bin/sh\nzellij run -c -f --width 80% --height 80% -x 10% -y 10% -- serpl\n' >$local_bin/floating-serpl
    chmod +x $local_bin/floating-serpl
end
