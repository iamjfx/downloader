#!/bin/bash
cd /mnt/timecapsule/Videos/TV-Shows/Guardians\ of\ the\ Galaxy/Season\ 3/
find . -mindepth 2 -type f -print -exec mv {} . \;

cd /mnt/timecapsule/Videos/TV-Shows/Ancient\ Aliens/Season\ 12/
find . -mindepth 2 -type f -print -exec mv {} . \;

cd /mnt/timecapsule/Videos/TV-Shows/Marvel\'s\ Agents\ Of\ S\ H\ I\ E\ L\ D/Season\ 5/
find . -mindepth 2 -type f -print -exec mv {} . \;

#cd /mnt/timecapsule/Videos/TV-Shows/The\ Handmaid\'s\ Tale/Season\ 1/
#find . -mindepth 2 -type f -print -exec mv {} . \;

#cd /mnt/timecapsule/Videos/TV-Shows/Marvel\'s\ Inhumans/Season\ 1/
#find . -mindepth 2 -type f -print -exec mv {} . \;

cd /mnt/timecapsule/Videos/TV-Shows/Marvel\'s\ Spider\ Man/Season\ 1/
find . -mindepth 2 -type f -print -exec mv {} . \;

cd /mnt/timecapsule/Videos/TV-Shows/Ducktales/Season\ 1/
find . -mindepth 2 -type f -print -exec mv {} . \;

cd /mnt/timecapsule/Videos/TV-Shows/Rick\ And\ Morty/Season\ 3/
find . -mindepth 2 -type f -print -exec mv {} . \;

#cd /mnt/timecapsule/Videos/TV-Shows/The\ X\ Files/Season\ 11/
#find . -mindepth 2 -type f -print -exec mv {} . \;

cd /mnt/timecapsule/Videos/TV-Shows/Mr\ Robot/Season\ 3/
find . -mindepth 2 -type f -print -exec mv {} . \;

cd /mnt/timecapsule/Videos/TV-Shows/Marvel\'s\ Runaways/Season\ 1/
find . -mindepth 2 -type f -print -exec mv {} . \;

#apaga pastas em branco
find /mnt/timecapsule/Videos/TV-Shows/ -empty -type d -delete

#log
echo "SERIES:" >> /var/log/flexget.log
echo `date` >> /var/log/flexget.log

cd /mnt/timecapsule/Videos/
find . -type f -iname \*.jpg -delete
find . -type f -iname \*.JPG -delete
find . -type f -iname \*.jpeg -delete
find . -type f -iname \*.png -delete
find . -type f -iname \*.PNG -delete
find . -type f -iname \*.txt -delete
find . -type f -iname \*.nfo -delete
find . -type f -iname \*.tbn -delete

cd /mnt/timecapsule/Videos/Movies
find . -mindepth 2 -type f -print -exec mv {} . \;
find /mnt/timecapsule/Videos/Movies/ -empty -type d -delete

echo "FILMES:" >> /var/log/flexget.log
echo `date` >> /var/log/flexget.log
