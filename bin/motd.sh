#!/usr/bin/env bash
#
tcLtG="\033[00;37m"    # LIGHT GRAY
tcDkG="\033[01;30m"    # DARK GRAY
tcLtR="\033[01;31m"    # LIGHT RED
tcLtGRN="\033[01;32m"  # LIGHT GREEN
tcLtBL="\033[01;34m"   # LIGHT BLUE
tcLtP="\033[01;35m"    # LIGHT PURPLE
tcLtC="\033[01;36m"    # LIGHT CYAN
tcW="\033[01;37m"      # WHITE
tcRESET="\033[0m"
tcORANGE="\033[38;5;209m"
#
# Time of day
HOUR=$(date +"%H")
if [ $HOUR -lt 12  -a $HOUR -ge 0 ]; then TIME="morning"
elif [ $HOUR -lt 17 -a $HOUR -ge 12 ]; then TIME="afternoon"
else TIME="evening"
fi
#
# System uptime
uptime=`cat /proc/uptime | cut -f1 -d.`
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
#
# System load
SYS_LOADS=`cat /proc/loadavg | awk '{print $1}'`
SYS_LOADS1=`cat /proc/loadavg | awk {'print $2'}`
SYS_LOADS2=`cat /proc/loadavg | awk {'print $3'}`
#
#Memory
MEMORY_USED=`free -m | grep Mem | awk '{print $3}'`
MEMORY_TOTAL=`free -m | grep Mem | awk '{print $2}'`
SWAP_USED=`free -m | grep Swap | awk '{print $3}'`
NUM_PROCS=`ps aux | wc -l`
IPADDRESS=`hostname --all-ip-addresses`
#RELEASE=`lsb_release -s -d | sed 's/"//g'`
RELEASE=`hostnamectl | grep "Operating System"`
#
#HDD
HDD_ROOT_USED=`df -h / | awk '/\// {print $5}'|grep -v "^$"`
echo -e $tcLtBL "============================================================================================"
echo -e $tcLtG " Good $TIME !                                           $tcORANGE System"
echo -e $tcLtBL "============================================================================================"
echo -e $tcLtG " - Hostname      :  `hostname -f`"
echo -e $tcLtG " - IP Address    :  $IPADDRESS"
echo -e $tcLtG " - Release       :$RELEASE"
echo -e $tcLtG " - Kernel        :  `uname -a | awk '{print $1" "$3" "$12}'`"
echo -e $tcLtG " - Users         :  Currently `users | wc -w` user(s) logged on"
echo -e $tcLtG " - Server Time   :  `date`"
echo -e $tcLtG " - Load Average  :  $SYS_LOADS $SYS_LOADS1 $SYS_LOADS2 | $NUM_PROCS processes running"
echo -e $tcLtG " - Memory        :  Used: $MEMORY_USED Mb / Total: $MEMORY_TOTAL Mb"
echo -e $tcLtG " - HDD used      :  Root: $HDD_ROOT_USED"
echo -e $tcLtG " - Swap used     :  $SWAP_USED Mb"
echo -e $tcLtG " - System uptime :  $upDays days $upHours hours $upMins minutes"
echo -e $tcLtBL "============================================================================================"
echo -e $tcRESET ""
#
