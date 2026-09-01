set fish_greeting
set -e EZA_COLORS
set -e LS_COLORS
set -Ue EZA_COLORS
set -Ue LS_COLORS
if status is-interactive
    # Commands to run in interactive sessions can go here
end

function gpush
    if test (count $argv) -eq 0
        echo "🚫 Please provide a commit message!"
        return 1
    end

    set commit_msg $argv[1]

    echo "🔧 Adding all changes..."
    git add .

    echo "📝 Committing with message: \"$commit_msg\""
    git commit -m "$commit_msg"

    echo "🚀 Pushing to remote..."
    git push

    echo "✅ All done, boss! You're crushing it 💥"
end

alias finder="ranger"
alias qdrant="~/Tools/Qdrant/release/qdrant"
alias vim="nvim"
alias cls="clear"
alias cat="batcat"
alias clean_junk="~/scripts/cleaner.sh"
alias requestly="~/Applications/Requestly-1.6.0.AppImage"
alias conda="~/anaconda3/bin/conda"
alias ls="eza --icons --color=always"
alias anaconda-navigator="/home/tamim/anaconda3/bin/anaconda-navigator"
alias n8n_stop="docker compose -f ./n8n/compose.yml down"
alias n8n_upgrade="curl -fsSL https://get.n8n.io | sh -s -- --upgrade"
alias n8n_uninstall="docker compose -f ./n8n/compose.yml down -v && rm -rf ./n8n"

# string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)

function inside
    set depth 2
    set path .
    set ignore_dirs "node_modules|.venv|venv|__pycache__|.git|dist|build|.next|vendor"

    for arg in $argv
        if string match -qr '^\d+$' -- $arg
            set depth $arg
        else
            set path $arg
        end
    end

    eza --tree --level=$depth --ignore-glob $ignore_dirs $path | cat
end

starship init fish | source

export VISUAL='nvim -u ~/.config/nvim/init.vim'

export EDITOR="$VISUAL"

export COLORTERM=truecolor
source "$HOME/.cargo/env.fish"

