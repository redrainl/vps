bandwidth_limit=5000
aa=$(vnstat -i eth0 -h |tail -2|head|awk '{print $8}')
unit=$(vnstat -i eth0 -h |tail -2|head|awk '{print $9}')
if [ $unit == 'GiB' ]; then
  echo "unit is GiB"
  aa=$(echo "$aa * 1000"|bc)
fi
# echo $unit
# echo $aa

content=$(vnstat -i eth0 -h |awk '{print $1"：rx"$2$3,"  tx:"$5$6}'|tail -5)
title="hostdare前一小时双向流量:"$(echo "scale=2;$aa / 1000"|bc)"G"

 echo $content
 echo $title

if  [ $(echo $aa|awk -F "." '{print $1}') -gt $bandwidth_limit]; then
    curl  -o /dev/null --data "token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX&title=$title&content=$content&template=html" http://pushplus.plus/send

fi
