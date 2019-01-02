set -g fish_key_bindings fish_vi_key_bindings

function fish_user_key_bindings
    bind -M insert \cf forward-char
end

alias sendEmail="sendEmail -f sun.wxg@gmail.com  -s smtp.gmail.com -o tls=yes -xu sun.wxg@gmail.com"
alias l1="ls -1"
alias l1f="ls -1F"
alias lf1="ls -1F"
#alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
#alias lg='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
alias lf='ls -Gl | grep ^d' #Only list directories
alias lsd='ls -Gal | grep ^d' #Only list directories, including hidden ones
alias l.='ls -d .*'

alias ..='cd ..'
alias ...='cd ../..'

alias diff='colordiff'

alias ports='netstat -tulanp'

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias tmux="tmux -2"

alias tree1="tree -L 1"
alias tree2="tree -L 2"

alias vim='gvim -v'

#alias pd="pushd"
#alias pop="popd"
#alias dirs="dirs -v"

alias isc="osc -A https://api.suse.de"
alias oosc="osc -A https://api.opensuse.org"
alias watch='watch '

alias ip="ip -c"

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
