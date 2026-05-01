set fish_greeting
set -gx LS_COLORS "fi=38;2;146;192;252:di=38;2;146;192;252:ln=38;2;136;192;208:ex=38;2;163;190;140"
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
# string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)

starship init fish | source

export VISUAL='nvim -u ~/.config/nvim/init.vim'
export EDITOR="$VISUAL"
export COLORTERM=truecolor
source "$HOME/.cargo/env.fish"

