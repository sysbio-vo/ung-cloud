from systemdspawner import SystemdSpawner

# Configuration file for jupyterhub.
c = get_config()  #noqa

# systemd spawner config
c.JupyterHub.spawner_class = SystemdSpawner
c.SystemdSpawner.unit_name_template = "jupyter-{USERNAME}-singleuser"
c.SystemdSpawner.username_template = "{USERNAME}"
c.SystemdSpawner.disable_user_sudo = False

c.JupyterHub.logo_file = '/opt/tljh/config/sysbio-logo1.png'

c.JupyterHub.allow_named_servers = True
c.JupyterHub.named_server_limit_per_user = 3

c.Spawner.notebook_dir = '/'
c.Spawner.default_url = '/lab/tree/home/{username}'
