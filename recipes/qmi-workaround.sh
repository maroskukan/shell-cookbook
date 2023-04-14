#!/bin/sh


max_retry=3
retry=1

if [ "$(ip addr show wwan0 | grep -c DOWN)" -ne 0 > /dev/null ]; then
    while ip addr show wwan0 | grep -c DOWN > /dev/null; do
        if [ "$retry" -le "$max_retry" ]; then
            if [ "$retry" -eq 1 ]; then
                logger -t netifd Trying to bring up wwan0
            else
                logger -t netifd Trying to bring up wwan0 - Retry $retry
            fi
            killall uqmi > /dev/null 2>&1
            ifdown wwan
            sleep 5
            ifup wwan
            let retry++
        sleep 10;
        else
            logger -t netifd Max retries reached
        return 1
        fi
    done
    logger -t netifd Successfully brought up wwan0
else
    logger -t netifd Interface wwan is not down, moving on
fi