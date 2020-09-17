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

## Several git account on same computer
In case you need to setup several git account on the same PC, this [link](https://medium.com/@xiaolishen/use-multiple-ssh-keys-for-different-github-accounts-on-the-same-computer-7d7103ca8693) is cool !

In brief generate the private ssh rsa key:
```bash
ssh-keygen -t rsa -b 4096 -C "private@mail.fr"
```

Store the generated key in `~/.ssh/private_rsa`. Then edit the `~/.ssh/config` file.
```bash
Host github.com
 HostName github.com
 User git
 AddKeysToAgent yes
 IdentityFile ~/.ssh/id_rsa
# Personal GitHub account
Host github.com-perso
 HostName github.com
 User git
 AddKeysToAgent yes
 IdentityFile ~/.ssh/perso_rsa
```

Now each time you need to clone a personnal repo, you can use the git clone command with github.com-perso domain address.
