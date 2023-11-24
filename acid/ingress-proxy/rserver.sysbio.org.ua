server {
    listen 80;
    listen [::]:80;
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name         rserver.sysbio.org.ua;
    ssl_certificate     /etc/letsencrypt/live/rserver.sysbio.org.ua/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/rserver.sysbio.org.ua/privkey.pem;
        
    location / {
        proxy_pass      http://localhost:9010;
        include proxy_params;
    }
}
