#!/bin/bash
corpid='ww52e5eccb4a39618c'
corpsecret='KuO6j0Q5AQGcs2qi8Id0QG1T8BuQTrn2wta3YgCq7qM' 
agentid='1000002'			
user="$1"					
title="$2"					
content="$3"		
token=$(curl -s https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$corpid\&corpsecret=$corpsecret |sed -nr 's#.*token":"(.*)","e.*#\1#p')
post=$(curl -s https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=$token -d  "{ \
   \"touser\": \"$user\", \
   \"msgtype\": \"text\", \
   \"agentid\": $agentid, \
   \"text\": { \
       \"content\": \"$title
-------------------------------------------------------------------------------
$content\" \
   }, \
   \"safe\":\"0\" \

}")
if [ $post = '{"errcode":0,"errmsg":"ok","invaliduser":""}' ]
then
echo "提交成功!"
else
echo "提交失败请检查!:$post"
fi
