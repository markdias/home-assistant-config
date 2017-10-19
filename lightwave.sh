!/bin/bash
LWHOST=172.16.7.72
LWPORT=8000
ROOM_DEVICE=$1
COMMAND=$2
LWCOM=NOTSET

get_command ()
{
case "$COMMAND" in
"ON") LWCOM=F1 
;;
"OFF") LWCOM=F0 
;;
"LOCK") LWCOM=F. 
;;
"STOP") LWCOM=F. 
;;
esac
}

run_command ()
{
echo ${LWHOST}
echo ${LWPORT}
echo ${ROOM_DEVICE}
echo -ne "101,!${ROOM_DEVICE}${LWCOM}|" | nc -w1 -u ${LWHOST} ${LWPORT}
sleep 1
}

get_command
run_command
