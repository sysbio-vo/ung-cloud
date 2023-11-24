server {
    listen 80;
    listen [::]:80;
    listen 443 ssl;
    listen [::]:443 ssl;
    listen 8099 ssl;

    server_name         jupyter.sysbio.org.ua;
    ssl_certificate     /etc/letsencrypt/live/jupyter.sysbio.org.ua/fullchain.pem
    ssl_certificate_key /etc/letsencrypt/live/jupyter.sysbio.org.ua/privkey.pem
        
    location / {
        proxy_pass       localhost:9001;
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}