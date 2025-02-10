# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


source $HOME/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# GIT SHORTCUTS
alias gs="git status"
alias glc="git log -1 HEAD --stat"
alias grs="git restore --staged "
alias ga="git add "
alias gc="git commit "
alias gcls="git config -l"
alias gp="git push "
alias gcun="git config user.name "
alias gcue="git config user.email "

gpriv() {
    git config --local core.sshCommand "ssh -i $1"
    echo "Set private key for Git: $1"
}
alias gpls="git config -l | grep sshcommand"

# OTHER IMPORTANT ALIASES
alias ls="ls -lath"
