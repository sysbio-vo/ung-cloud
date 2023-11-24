I will need the following config:
- `https://jupyter.sysbio.org.ua:443   ->   acid:9002`
- `http://jupyter.sysbio.org.ua:80   ->   acid:9001`
- `tcp://jupyter.sysbio.org.ua:8099   ->   acid:8099`
- `https://rstudio.sysbio.org.ua:443   ->   acid:9011`
- `http://rstudio.sysbio.org.ua:80   ->   acid:9010`

tljh's traefik instance has https DISABLED.
Ingress https is managed by reverse proxy.

I will use nginx reverse proxy  
https://www.digitalocean.com/community/tutorials/how-to-configure-nginx-as-a-reverse-proxy-on-ubuntu-22-04

```
sudo apt install nginx
# I skip the ufw because openstack security groups will manage it
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot certonly --nginx
# jupyter.sysbio.org.ua rserver.sysbio.org.ua

sudo ln -s /home/mkrooted/ung-cloud/acid/ingress-proxy/jupyter.sysbio.org.ua /etc/nginx/sites-enabled/
sudo ln -s /home/mkrooted/ung-cloud/acid/ingress-proxy/rserver.sysbio.org.ua /etc/nginx/sites-enabled/



```