echo off
rm /etc/dnsdumpster/youtube-domains.txt
rm /etc/dnsdumpster/youtube-filtered.txt
rm /etc/dnsdumpster/youtube-ads.txt
python /etc/dnsdumpster/dnsdumpster/ADS_youtube.py > /etc/dnsdumpster/youtube-domains.txt
grep ^r /etc/dnsdumpster/youtube-domains.txt >> /etc/dnsdumpster/youtube-filtered.txt
sed 's/\s.*$//' /etc/dnsdumpster/youtube-filtered.txt >> /etc/dnsdumpster/youtube-ads.txt
cat /etc/dnsdumpster/youtube-ads.txt > /var/www/html/youtube-ads-list.txt
#greps the log for youtube ads and appends to /var/www/html/youtube-ads-list.txt
grep r*.googlevideo.com /var/log/pihole.log | awk '{print }'| grep -v '^googlevideo.com\|redirector' | sort -nr | uniq >> /var/www/html/youtube-ads-list.txt
#removes duplicate lines from /var/www/html/youtube-ads-list.txt
perl -i -ne 'print if ! {#removes duplicate lines from /var/www/html/youtube-ads-list.txt}++' /var/www/html/youtube-ads-list.txt
#updates pihole blacklist/whitelist
pihole -g
