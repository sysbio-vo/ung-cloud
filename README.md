# ung-cloud
Scripts, configurations, and more, related to UNG grid/cloud infrastructure.

Download and install Vagrant from [here](https://www.vagrantup.com/downloads.html). If you use Ubuntu you can just execute following commands:

```
wget https://releases.hashicorp.com/vagrant/2.0.3/vagrant_2.0.3_x86_64.deb
sudo dpkg -i vagrant_2.0.3_x86_64.deb
```

Install [Vagrant OpenStack plugin](https://github.com/ggiamarchi/vagrant-openstack-provider):

```
vagrant plugin install vagrant-openstack-provider
```

Clone this repo:
```
git clone https://github.com/sysbio-vo/ung-cloud.git
cd ung-cloud/cloud/vagrant
mkdir modules
```

Change _Vagrantfile_ to contain proper username and password in OpenStack project. Create virtual machine with:
```
vagrant up
```
Normally it should ssh automatically, but sometimes in hangs (it might be a sign that smth is wrong), just CTRL+C and do:
```
vagrant ssh
```

## Troubleshooting

If you deleted virtual machine via GUI some versions of plugin might results in error, in that case delete following folder:
```
rm -rf .vagrant/
```

I noticed that sometimes machine is created, but not properly, for example _user_data_ script is not executed during the boot. Most probably it is a bug with the OpenStack installation I use. In such case I reload the machine:
```
vagrant reload
```
More info about Vagrant OpenStack plugin you can find [here](https://github.com/ggiamarchi/vagrant-openstack-provider)
