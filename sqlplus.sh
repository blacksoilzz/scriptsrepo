#!/bin/bash

DBNAME=$1
PASSWD=$2
SQL=$3

sqlplus -S /nolog <<EOF
conn $DBNAME/$PASSWD
$3
exit
EOF

#或者直接使用sqlplus执行命令，其中参数1参数2分别对应&1 &2
#cat sql/test.sql/test
#select &1 from &2
#quit;


#sqlplus / as sysdba @sql/test.sql 参数1 参数2
#以下为网上参考
# [oracle@jumper oracle]$ cat a.sh
# sqlplus -S "/ as sysdba" << !
# set heading off
# col today noprint
# column today new_val dat
# select to_char( sysdate, 'yyyy-mm-dd') today from dual;
# host echo 'today is ' &dat
# exit;
# exit;
# !
# [oracle@jumper oracle]$ ./a.sh

# today is  2005-04-11

# [oracle@jumper oracle]$ 
# itpub上的Toms_zhang朋友提供了另外一种方法:
# [oracle@jumper oracle]$ more a.sh

#!/bin/ksh
# VALUE=`sqlplus -silent "/ as sysdba" < < END
# set pagesize 0 feedback off verify off heading off echo off
# select max(sequence#) from v\\\$log_history;
# exit;
# END`

# if [ -z "$VALUE" ]; then
# echo "No rows returned from database"
# exit 0
# else
# echo "Max Sequence Number: $VALUE"
# fi


# [oracle@jumper oracle]$ ./a.sh
# Max Sequence Number:        17