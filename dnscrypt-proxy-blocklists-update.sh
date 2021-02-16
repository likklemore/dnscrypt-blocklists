cd /opt/dnscrypt-proxy/
chattr -i /etc/resolv.conf
sed -i '1s/^/nameserver 89.233.43.71\n/' /etc/resolv.conf
#wget -O blocked-ips.txt https://block.energized.pro/extensions/ips/formats/list.txt
python generate-domains-blocklist.py > dnscrypt-blacklist-domains.txt
rm -rf *.md
systemctl restart dnscrypt-proxy.service
sed -i '1d' /etc/resolv.conf
chattr +i /etc/resolv.conf
