https://jupyterhub.readthedocs.io/en/latest/

I selected [The Littlest JupyterHub](https://github.com/jupyterhub/the-littlest-jupyterhub) - "distribution is suitable if you need a small number of users (1-100) and a single server with a simple environment."

https://tljh.jupyter.org/en/latest/

**Installing TLJH**

- `sudo apt install python3 python3-dev git curl`
- `vim jupyterhub-install.sh`   
```bash
# jupyterhub-install.sh
curl -L https://tljh.jupyter.org/bootstrap.py \
    | sudo python3 - \
    --admin mkrooted --admin aln
```
- `bash jupyterhub-install.sh`

Via ssh, pwd is `ung-cloud/acid`:
```bash
sudo cp jupyterhub/sysbio-logo1.png /opt/tljh/config/sysbio-logo1.png
sudo cp jupyterhub/jupyterhub_config.py /opt/tljh/config/jupyterhub_config.d/jupyterhub_config.py

sudo tljh-config set http.address jupyter.sysbio.org.ua
sudo tljh-config set http.port 9001
sudo tljh-config set https.enabled false

sudo tljh-config set limits.cpu 24
sudo tljh-config set limits.memory 130G
sudo tljh-config reload proxy
sudo tljh-config reload hub
```

Append to `/etc/hosts`:
```
10.0.1.72 jupyter.sysbio.org.ua
```
Where `10.0.1.72` is IP of eth interface
