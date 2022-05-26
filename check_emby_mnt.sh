#!/bin/bash
aa=$(docker exec emby sh -c "ls  /mnt/share1" |tr -d '\n' |grep 4K265HotFilmHotTVNetflixFilmNetflixTVP_Child)

if [ $? == 0 ]; then
  echo "ok"
else
  echo "something wrong"
  systemctl stop rclone@gdrive
  sleep 10
  fusermount -u -z /home/gdrive
  systemctl start rclone@gdrive
  sleep 10

  docker restart emby
  title="ocp1 emby restart"
  curl  -o /dev/null --data "token=XXXXXXXXXXXXXXXXXXXXXXXXXX&title=$title&content=$title&template=html" http://pushplus.plus/send

 
fi
