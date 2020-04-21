#Git aliases
alias gb='git branch'
alias gba='git branch -a'
alias gbs='for branch in $(git branch -r | grep -v HEAD);do echo -e $(git show --format="%ci" $branch | head -n 1) \\t$branch; done | sort -r'
alias gd='git diff '
alias gdd='git status  -suno'
alias gds='git diff --stat'
alias gdsn='git status  --untracked-files=no'
alias gg='git grep -n'
alias ggg='git grep -n -p -10'
alias ggs='git status -uno'
alias gl='git log --oneline  --decorate '
alias gla='git log --color --graph --decorate --abbrev-commit --pretty=oneline --branches --all'
alias gll='git log --oneline  --decorate  FETCH_HEAD..HEAD '
alias glm='git log --oneline master..'
alias gvd='git difftool -t vimdiff '
alias gls='git ls-files '
alias gs='git status'
alias ga='git add'
alias gc='git commit -s'
alias gca='git commit -s --amend'


alias ctags="ctags -R --c-kinds=+p --fields=+iaS --extra=+q --links=no"
alias t="sed -i 's/[ \t]*$//'"


# Repo aliases
alias rs="repo status"
alias rc="repo checkout"
alias rt="repo start --all"
alias rd="repo diff"
alias ry='repo sync -j 8'
alias rb='repo branches'
alias rr='repo rebase'
alias ru='repo upload -t'
alias rp='repo prune'
alias ro='repo info -o'

# Research aliases
alias  f='find `pwd` | grep -v tags | grep "\.[chs]$" | grep -i '
alias fa='find `pwd` | grep -v tags | grep -i '
alias ff='find `pwd` -type f | grep -v tags | grep "\.[ch]$" | xargs grep -I --color -n '
alias ffi='find `pwd` -type f | grep -v tags | grep "\.[ch]$" | xargs grep -I --color -ni '
alias ffa='find `pwd` -type f | grep -v tags | xargs grep -I --color -n '
alias ffai='find `pwd` -type f | grep -v tags | xargs grep -I --color -ni '
alias fh='find `pwd` | grep -v tags | grep "\.h$"    | xargs grep --color -ni '
alias fc='find `pwd` | grep -v tags | grep "\.c$"    | xargs grep --color -ni '
