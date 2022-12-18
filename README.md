# Shell Samples

Shell script samples that provide demonstration for bash capabilities and help automate everyday tasks.

- [Shell Samples](#shell-samples)
  - [Documentation](#documentation)
  - [Optional packages](#optional-packages)
  - [Execution](#execution)
  - [Tips and Tricks](#tips-and-tricks)
    - [HEREDOC](#heredoc)
    - [Elevated Tee](#elevated-tee)
    - [Block Device UUID](#block-device-uuid)
    - [Session recording](#session-recording)


## Documentation

- [Sockets](https://admin-ahead.com/forum/general-linux/how-to-open-a-tcpudp-socket-in-a-bash-shell/)


## Optional packages

The *packages.sh* contain optional tooling for working with shell scripts. Currently supports **yum** and **apt** based package managers.
```
chmod u+x
sudo ./packages.sh
```

## Execution

There are multiple ways how to execute a bash script. When #! (shebang) is used in the script header and you execute the script from your current bash process a new subprocess is started assuming executable permission have been set as demonstrated in the above example.

If script does not leverage shebang, it can be executed using ``bash myscript`` syntax, executable permission is not required and this options allows use of bash options such as ``-x`` for debuging.

The script can be also imported into the current shell process using shell built-in source, for example ``source myscript`` syntax, or using alias ``. myscript``. This is used when using .bashrc file.

For scripts with long execution time it is feasible to run them in background using &. For example ``myscript &``. It will be disconnected from the interactive session and will be suspended if it tries to read input from terminal.

If you want to exit your current session and still keep the script running in backgroud you can use the nohup command, for example ``nohup myscript &``.

To run script with lower priority use nice. For example ``nice myscript``.

To run script at another time (one time), you can use at utility. For example ``at -f myscript noon tomorrow``

Another option is to use Cron or launchd or Upstart.


## Tips and Tricks

### HEREDOC

In rare cases when no "real" text editor is available in system (e.g. stripped down container) **cat** tool can be used to write a file interactively using HEREDOC EOF and END as demonstrated below.

**Example 1**
```
cat << EOF > /tmp/yourfilehere
These contents will be written to the file.
        This line is indented.
EOF
```
**Example 2**
```
cat > myhosts <<END
127.0.0.1 localhost
192.168.1.1 gateway
END
```


### Elevated Tee

Consider the following example of appending a new host entry as standard user.

```bash
sudo echo "1.1.1.1 cloudflare" >> /etc/hosts
```

This will fail as the redirection happens at the shell level and therefore evalation is not effective. To solve this you could use the `tee` utility as shown below:

```bash
echo "1.1.1.1 cloudflare" | sudo tee -a /etc/hosts
```

Also `tee` can be used in `vim` while saving a file as a standard user. If you forget to evalate privileges for system files that you just editing, you would need to exit without saving changes. There is, however a better way to save changes, while in `vim` normal mode type:

```bash
w !sudo tee%
```


### Block Device UUID

Quickly retrieve block device UUID.

```bash
blkid /dev/sdb | awk '{ print $3 }' | cut -d'=' -f2 | tr -d '"'
```

### Session recording

Using the `script` utility you are able to record your shell session. Simply invoke this command and when done use `exit`. By default the session will be saved in current working directory as `typescript` text file.

### Bash shortcuts

In order to display bash shortcuts that are available use the `bind` shell built in with `-P` option.

```bash
bind -P | grep "\\C-a"
beginning-of-line can be found on "\C-a", "\eOH", "\e[1~", "\e[H".
```