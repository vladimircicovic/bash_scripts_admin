SLEEP_TIME=2
SITE=gmail.com
while true; do
(curl -s $SITE > /dev/null 2>&1)|| (echo no)
sleep $SLEEP_TIME
done
