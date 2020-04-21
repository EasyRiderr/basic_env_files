# Les fichiers de configurations basiques pour Linux, VIM, ...

## Bash prompt
```bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;30m\][`date +%Hh%M`]\[\033[00m\]\$ '
```
## Git rough status within PS1
```bash
. "$(git --exec-path)/git-sh-prompt"
PROMPT_COMMAND="$(printf '%q ' __git_ps1 "${PS1%%\\\$*}" "\\\$${PS1#*\\\$}");$PROMPT_COMMAND"
GIT_PS1_SHOWCOLORHINTS=t
GIT_PS1_SHOWDIRTYSTATE=t
GIT_PS1_SHOWSTASHSTATE=t
#GIT_PS1_SHOWUNTRACKEDFILES=t
GIT_PS1_SHOWUPSTREAM=git
```

## Git commands to configure env
- To add a global gitignore
`git config --global core.excludesfile "~/.gitignore_global"`
- To define the global git editor
`git config --global core.editor "vim"`
- Define git global user name and mail
`git config --global user.email "yo_dumas@hotmail.fr"`
`git config --global user.name "Yoan Dumas"`
