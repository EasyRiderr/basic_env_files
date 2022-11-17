## Several git account on same computer

In case you need to setup several git account on the same PC, this [link](https://medium.com/@xiaolishen/use-multiple-ssh-keys-for-different-github-accounts-on-the-same-computer-7d7103ca8693) is cool !

In brief generate the private ssh rsa key:
```bash
ssh-keygen -t rsa -b 4096 -C "perso@mail.fr"
```

Store the generated key in `~/.ssh/perso_rsa`. Then edit the `~/.ssh/config` file.
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

## Installing basic environment files

```bash
sudo apt -qq -y install wget && wget -q https://raw.githubusercontent.com/EasyRiderr/basic_env_files/master/install_my_env.sh && chmod a+x install_my_env.sh && sudo ./install_my_env.sh && rm install_my_env.sh
```
