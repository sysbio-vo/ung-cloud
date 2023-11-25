
# Configuration file for jupyterhub.
c = get_config()  #noqa
c.JupyterHub.logo_file = '/opt/tljh/config/sysbio-logo1.png'

c.JupyterHub.allow_named_servers = True
c.JupyterHub.named_server_limit_per_user = 3

c.Spawner.notebook_dir = '/'
c.Spawner.default_url = '~'
