# Shell Samples

Various shell script samples that help automate everyday tasks.

## Optional packages

The *packages.sh* contain optional tooling for working with shell scripts.

## Tips

In rare cases when no "real" text editor is available in system (e.g. stripped down container) **cat** tool can be used to write a file interactively.

```
cat << EOF > /tmp/yourfilehere
These contents will be written to the file.
        This line is indented.
EOF
```