# Required for websockets connection
map $http_upgrade $connection_upgrade {
    default upgrade;
    ''      close;
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;

    server_name         jupyter.sysbio.org.ua;
    ssl_certificate     /etc/letsencrypt/live/jupyter.sysbio.org.ua/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/jupyter.sysbio.org.ua/privkey.pem;
    
    location / {
        proxy_pass      http://localhost:9001;
        include proxy_params;
        
        # websockets connection
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
    }
}
