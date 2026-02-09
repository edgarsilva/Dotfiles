# N version manager
# set -gx N_PREFIX "$HOME/.n"
# fish_add_path $N_PREFIX/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

# pnpm
# set -gx PNPM_HOME "/home/edgar/.local/share/pnpm"
# fish_add_path "$PNPM_HOME"
# pnpm end

# Golang
# set -gx GOROOT /usr/local/go
# set -gx GOPATH $HOME/.go
# set -gx GOBIN $GOPATH/bin
# fish_add_path $GOROOT/bin
# fish_add_path $GOBIN

# bun
set -gx BUN_INSTALL $HOME/.bun
fish_add_path $BUN_INSTALL/bin

# fzf
# alias fd="fdfind"
# set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix'

# zoxide
zoxide init fish | source
alias zz="z -"
alias cd="z"
alias docker-compose="docker compose"

# rbenv
# status --is-interactive; and source (rbenv init -|psub)
# source (rbenv init -|psub)
# fish_add_path $HOME/.rbenv/bin
# set ruby_version (rbenv version-name)
# set -gx GEM_HOME "$HOME/.rbenv/versions/$ruby_version/lib/ruby/gems"
# set -gx GEM_PATH "$GEM_HOME"
# fish_add_path "$GEM_HOME/bin"

# node & npm
# set node_root (npm root -g)
# set -gx NODE_PATH "$node_root"
# fish_add_path NODE_PATH

# flatpak
fish_add_path /var/lib/flatpak/exports/share
fish_add_path $HOME/.local/share/flatpak/exports/share

# composer
# fish_add_path $HOME/.composer/vendor/bin

# julia
# fish_add_path /home/edgar/.juliaup/bin

# pulumi
fish_add_path $HOME/.pulumi/bin

# opencode
fish_add_path /home/edgar/.opencode/bin

# ASDF configuration code
# if test -z $ASDF_DATA_DIR
#     set _asdf_shims "$HOME/.asdf/shims"
# else
#     set _asdf_shims "$ASDF_DATA_DIR/shims"
# end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
# if not contains $_asdf_shims $PATH
#     set -gx --prepend PATH $_asdf_shims
# end
# set --erase _asdf_shims

# set go_version (asdf current golang | awk '{print $2}')
# set -gx PATH $HOME/.asdf/installs/golang/$go_version/bin $PATH

mise activate fish | source

# opencode
# fish_add_path /home/edgar/.opencode/bin
if status is-interactive
    # source (rbenv init -|psub)
    # Fish syntax highlighting
    # set -g fish_color_autosuggestion 888 brblack
    set -g fish_color_cancel -r
    # set -g fish_color_command --bold
    # set -g fish_color_comment red
    set -g fish_color_cwd green
    set -g fish_color_cwd_root red
    # set -g fish_color_end brmagenta
    # set -g fish_color_error brred
    # set -g fish_color_escape bryellow --bold
    set -g fish_color_history_current --bold
    set -g fish_color_host normal
    set -g fish_color_match --background=brblue
    # set -g fish_color_normal normal
    # set -g fish_color_operator bryellow
    # set -g fish_color_param cyan
    # set -g fish_color_quote yellow
    # set -g fish_color_redirection brblue
    # set -g fish_color_search_match bryellow '--background=brblack'
    # set -g fish_color_selection white --bold '--background=brblack'
    set -g fish_color_user brgreen
    set -g fish_color_valid_path --underline
    set -g fish_greeting

    # Kanagawa Fish shell theme
    # A template was taken and modified from Tokyonight:
    # https://github.com/folke/tokyonight.nvim/blob/main/extras/fish_tokyonight_night.fish
    set -l foreground DCD7BA normal
    set -l selection 6A9589 brcyan
    set -l comment 727169 brblack
    set -l red FF5D62 red
    set -l orange FF9E64 brred
    set -l yellow C0A36E yellow
    set -l green 98BB6C green
    set -l purple E6C384 purple
    set -l cyan 7FB4CA cyan
    set -l pink 938AA9 brmagenta

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $green
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $cyan
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment

    fish_vi_key_bindings

    alias nv="nvim"
    alias ls="eza --group --tree --level=1 --icons"
    alias zz="z -"
    alias cd="z"

    alias ff="/home/edgar/.config/fastfetch/ff"
    alias cyank="wl-copy"
    alias ccopy="wl-copy"
    alias cpaste="wl-paste"

    # alias bat="batcat"
    # alias cat="bat"

    # alias batail="tail -f /var/log/pacman.log | bat --paging=never -l log"
    # function batail --wraps tail --description "tail -f <some_file_path> | bat --paging=never -l log"
    #     tail -f $argv | bat --paging=never -l log
    # end

    starship init fish | source

    if test -n "$NVIM"
        echo "This terminal was started by Neovim."
    else
        # echo "This is a normal terminal."

        # neofetch | lolcat -p 4 -S 16 -F 0.1
        # echo "NEOFETCH LOADING..."
        # neofetch --config ~/.config/neofetch/config.conf
        bash ~/.config/fastfetch/ff
    end

    # NVM
    # load_nvm >/dev/stderr
end
