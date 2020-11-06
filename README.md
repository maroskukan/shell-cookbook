# Shell Samples

Shell script samples that provide demostration for bash capabilities and help automate everyday tasks.

## Optional packages

The *packages.sh* contain optional tooling for working with shell scripts. Currently supports **yum** and **apt** based package managers.
```
chmod u+x
sudo ./packages.sh
```

## Execution

There are multiple ways how to execute a bash script. When #! (shebang) is used in the script header and you execute the script from your current bash process a new subprocess is started assuming executable permission have been set as demostrated in the above example.

If script does not leverage shebang, it can be executed using ``bash myscript`` syntax, executable permission is not required and this options allows use of bash options such as ``-x`` for debuging.

The script can be also imported into the current shell process using shell built-in source, for example ``source myscript`` syntax, or using alias ``. myscript``. This is used when using .bashrc file.

For scripts with long execution time it is feasible to run them in background using &. For example ``myscript &``. It will be disconnected from the interactive session and will be suspended if it tries to read input from terminal.

If you want to exit your current session and still keep the script running in backgroud you can use the nohup command, for example ``nohup myscript &``.

To run script with lower priority use nice. For example ``nice myscript``.

To run script at another time (one time), you can use at utility. For example ``at -f myscript noon tomorrow``

Another option is to use Cron or launchd or Upstart. 


## Tips and Tricks

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
