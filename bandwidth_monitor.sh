title=$(vnstat -i eth0 -d |awk '{print "Hostdare流量",$8,$9}'|tail -3|head -n 1)
aa=$(vnstat -i eth0 -d |awk '{print $1,$8,$9,"<br>"}'|tail -7|head -n 5|sed "s/\n/<br>/g")
curl  -o /dev/null --data "token=78443c6feb0241029bfe155c84b90e8d&title=$title&content=$aa&template=html" http://pushplus.plus/send


