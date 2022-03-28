aa=$(vnstat -i ens3 -h |tail -2|head|awk '{print $8}')
unit=$(vnstat -i ens3 -h |tail -2|head|awk '{print $9}')
if [ $unit == 'GiB' ]; then
  echo "unit is GiB"
  aa=$(echo "$aa * 1000"|bc)
fi
# echo $unit
# echo $aa

content=$(vnstat -i ens3 -h |awk '{print $1"点：rx"$2$3,"  tx:"$5$6}'|tail -5)
title="OCP-1前一小时双向流量:"$aa"M"

# echo $content
# echo $title

if  [ $(echo $aa|awk -F "." '{print $1}') -gt 10000 ]; then
    curl  -o /dev/null --data "token=78443c6feb0241029bfe155c84b90e8d&title=$title&content=$content&template=html" http://pushplus.plus/send

fi

