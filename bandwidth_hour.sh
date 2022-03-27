aa=$(( $(vnstat -i eth0 -h |tail -1|awk '{print $8}'|sed 's/,//'|awk -F '.' '{print $1}')+$(vnstat -i eth0 -h |tail -1|awk '{print $9}'|sed 's/,//'|awk -F '.' '{print $1}')  ))
content=$(vnstat -i eth0 -h |awk '{print $7"点：rx"$8,"  tx:"$9}'|tail -5)
title="Hostdare前一小时双向流量:"$aa"M"
echo $aa
echo $content
echo $title

if  [ $aa -gt 6000 ]; then
    curl  -o /dev/null --data "token=78443c6feb0241029bfe155c84b90e8d&title=$title&content=$content&template=html" http://pushplus.plus/send

fi
