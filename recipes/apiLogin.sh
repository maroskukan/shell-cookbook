#!/bin/bash
#
# Create by Metsi Technologies - www.metsi.co.uk
# Licensed under GNU General Public License version 3
#

COOKIEFILE="avi.cookie"
GETFILE="avi.get"
POSTFILE="avi.post"
LOGOUTFILE="AVI_LOGOUT"
DEFVERSION="17.1.2"

# See if device IP has been given as first argument
validIP=0
while [ $validIP == 0 ]
do
    echo -n "Please provide the IP address of the AVI controller to login: "
    read IP
    if [[ $IP  =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]
    then
        validIP=1
    else
        echo "Given IP is not a valid IPv4 address"
        echo
    fi
done

user=0
while [ $user == 0 ]
do
    echo -n "Please provide an administrator username: "
    read USER
    # See if some input was given
    if [ -z "$USER" ]
    then
        echo "No username was given"
        echo
    else
        user=1
    fi
done

pass=0
while [ $pass == 0 ]
do
    echo -n "Please provide the password for this user: "
    read -s PASS
    # See if some input was given
    if [ -z "$PASS" ]
    then
        echo "No password was given"
        echo
    else
        pass=1
        echo
    fi
done

echo -n "Please provide the API version to use [$DEFVERSION]: "
read VERSION
# See if some input was given
if [ -z "$VERSION" ]
then
    VERSION=$DEFVERSION
    echo "No specific version specified, using $VERSION"
    echo
else
    echo "Will use version: $VERSION"
fi
sleep 1

AUTH="{\"username\":\"$USER\",\"password\":\"$PASS\"}"

echo -n "Log in as $USER..."
/usr/bin/curl -k -s --connect-timeout 5 -c $COOKIEFILE -X POST -H 'Content-Type: application/json' -d $AUTH https://$IP/login >/dev/null
RESULT=$?
if [ "$RESULT" -eq 0 ]
then
    echo -n "..."
else
    /bin/rm -f $COOKIEFILE
    echo "failed with exit code $RESULT"
    exit 1
fi

# Do we have a cookie file? (authentication was ok?)
if [ ! -f "$COOKIEFILE" ]
then
    echo "Login failed, no cookie file created."
    exit 1
else
    # Getting CSRF token from cookie file
    CSRFTOKEN=$(grep csrftoken $COOKIEFILE | awk '{ print $7 }')
    # Do we have a token?
    if [ -z "$CSRFTOKEN" ]
    then
        echo "Login failed, no CSRFTOKEN set. Check your credentials!"
        /bin/rm -f $COOKIEFILE
        exit 1
    else
        echo "ok"
    fi
fi

# Saving curl commands to a command file
echo "-b $COOKIEFILE" > $GETFILE
echo "-H \"X-CSRFToken:$CSRFTOKEN\"" >> $GETFILE
echo "-H \"X-Avi-Version:$VERSION\"" >> $GETFILE
echo "-H \"Accept-Encoding:application/json\"" >> $GETFILE
echo "-X GET" >>  $GETFILE

echo "-b $COOKIEFILE" > $POSTFILE
echo "-H \"X-CSRFToken:$CSRFTOKEN\"" >> $POSTFILE
echo "-H \"X-Avi-Version:$VERSION\"" >> $POSTFILE
echo "-H \"Content-Type:application/json\"" >> $POSTFILE
echo "-H \"Referer:https://$IP\"" >> $POSTFILE
echo "-X POST" >> $POSTFILE

# Creating logout script

echo "curl -k -b $COOKIEFILE -X POST -H \"X-CSRFToken:$CSRFTOKEN\" -H \"Referer:https://$IP\" \"https://$IP/logout\"" > $LOGOUTFILE
echo "rm $COOKIEFILE $GETFILE $POSTFILE $LOGOUTFILE" >> $LOGOUTFILE
chmod u+x $LOGOUTFILE


echo "----------"
echo "Execute commands to AVI controller $IP using version $VERSION:"
echo
echo "Example GET command: curl -k -K $GETFILE \"https://$IP/api/ \""
echo "Example POST command: curl -k -K $POSTFILE -d \"@<JSONFILE>\" \"https://$IP/api/ \""
echo
sleep 1
echo
echo "Remarks:"
echo "  -k: to not validate HTTPS certificate (for self signed certificate usage)"
echo "  <JSONFILE>: replace with the filename (and path) where the JSON config is located that you want to apply"
echo
sleep 1
echo
echo "When finished, Logout to the AVI controller via ./$LOGOUTFILE"
echo
echo "Enjoy!"
echo "Greetings, Metsi - www.metsi.co.uk"
echo
echo
