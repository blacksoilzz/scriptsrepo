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