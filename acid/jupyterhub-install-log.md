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

Inside jupyter hub terminal:
```bash
sudo jupyterhub --generate-config -f /home/jupyter-mkrooted/assets/jupyterhub_config.py
```

Via ssh:
```bash
sudo -iu jupyter-mkrooted
touch /home/jupyter-mkrooted/assets/jupyterhub_config.py
sudo ln /home/jupyter-mkrooted/assets/jupyterhub_config.py /opt/tljh/config/jupyterhub_config.d/jupyterhub_config.py

sudo tljh-config set http.address jupyter.sysbio.org.ua
sudo tljh-config set http.port 9001
sudo tljh-config set https.enabled false
```

Append to `jupyterhub_config.py`:
```python
# Configuration file for jupyterhub.
c = get_config()  #noqa
c.JupyterHub.logo_file = '/home/jupyter-mkrooted/assets/sysbio-logo1.png'
```

Append to `/etc/hosts`:
```
10.0.1.72 jupyter.sysbio.org.ua
```
Where `10.0.1.72` is IP of eth interface

## Install Docker
https://docs.docker.com/engine/install/ubuntu/

```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update


sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

```

