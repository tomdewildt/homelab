# Home Lab
![CI Status](https://github.com/tomdewildt/homelab/workflows/ci/badge.svg?branch=master)

This repository contains the configuration for my home lab servers and network.

# How to run

Prerequisites:
* vagrant version ```2.2.7``` or later
* ansible version ```2.8.5``` or later
* ansible-lint version ```4.2.0``` or later

### Remote

1. Run ```make run/remote``` to execute the playbook.

### Virtual

1. Run ```make vm/start``` to start the virtual machines.
2. Run ```make run/virtual``` to execute the playbook.

Run ```make vm/stop``` to stop the virtual machines and ```make vm/remove``` to remove them.

# Goals

The primary goals of this project are...

* to have a highly-available home lab, with no SPOF (Single Point of Failure)
* to have a production grade kubernetes cluster.
* to learn and have fun.

# In summary

I have 4 physical machines plugged into 1 switch. One server is used as a router/gateway, this server handles the IPv4 NAT, VLAN, DHCP, DNS and VPN. The other machines are used in a kubernetes cluster with one master and two workers.

I have one APC UPS that handles all the power for the system. It keeps all the gear running during a power outage. When the battery hits a critical level all the servers are gracefully shutdown using ```apcupsd```.

# Gear

### Servers

* 2x [Dell PowerEdge R210 II](https://www.dell.com/ky/business/p/poweredge-r210-2/pd)
  * Intel Xeon X3460
  * 8GB RAM (DDR3-1333)
  * OS: 250GB 3.5 SATA HDD
  * Dell Power Supply 250W
* 2x [Dell PowerEdge R710](https://www.dell.com/en-uk/work/shop/cty/dell-poweredge-r710-rack-server/spd/poweredge-r710)
  * 2x Intel Xeon X5570 or 2x Intel Xeon X5560
  * 48GB RAM (DDR3-1333)
  * OS: 6x 300GB 3.5 SAS HDD in RAID 5
  * 2x Dell Power Supply 870W

### Switches

* 1x [Dell PowerConnect 5424](https://www.dell.com/en-us/work/shop/cty/powerconnect-5424-switch/spd/powerconnect-5424)

### Other

* Old HP monitor
* Old Dell keyboard and mouse combo

### Power

The whole setup including all servers and switches draws about 530 watts idle.

* 1x [Dell Smart-UPS 3000VA](https://www.dell.com/en-my/shop/dell-smart-ups-3000va-lcd-rm-ups-2700-watt-3000-va-dlt3000rmi2u/apd/a7522112/power-cooling-data-center-infrastructure)

### ISP

* [Ziggo Zakelijk](https://www.ziggo.nl/zakelijk/)

# Software

* [pfSense](https://www.pfsense.org/) is the most popular, open-source firewall operating system based on FreeBSD.
* [Kubernetes](https://kubernetes.io/) is an open-source system for automating deployment, scaling, and management of containerized applications.

# Config

### Network config

* LAN is unused
* VLAN10 ```10.10.0.0/24```, is used for infrastructure (routers, switches, ups, etc).
* VLAN20 ```10.20.0.0/24```, is used for servers.
* VLAN30 ```10.30.0.0/24```, is used for management.
* VLAN40 ```10.40.0.0/24```, is used for DMZ services that need to be exposed to the internet.
* VLAN50 ```10.50.0.0/24```, is used for trusted clients.
* VLAN60 ```10.60.0.0/24```, is used for untrusted clients.

The VPN runs on the ```10.70.0.0/24``` subnet and the virtual cluster network for kubernetes on the ```10.80.0.0/16``` subnet.

# References

[pfSense VLAN](https://docs.netgate.com/pfsense/en/latest/book/vlan/pfsense-vlan-configuration.html)

[Dell PowerConnect Serial](http://robwillis.info/2012/12/dell-powerconnect-5324-cable-tips-basic-setup-and-configuration-via-putty/)

[Dell PowerConnect Factory Reset](https://www.dell.com/support/article/us/en/04/how10330/how-to-reset-a-powerconnect-2800-series-switch-to-factory-default)

[Dell PowerConnect VLAN Setup](https://www.dell.com/support/article/nl/nl/nldhs1/how10366/how-to-create-vlans-on-a-dell-networking-powerconnect-switches)

[Dell PowerConnect Command Line Manual](https://www.manualslib.com/manual/419225/Dell-Powerconnect-5424.html)

[APC UPS Serial](https://www.apc.com/us/en/faqs/FA156064/)

[APC UPS Factory Reset](https://www.apc.com/et/en/faqs/FA175980/)

[APC UPS Install Centos 7](https://www.svennd.be/install-apcupsd-on-centos-7/)

[Metallb VLAN Setup](https://itnext.io/kubernetes-metallb-vlan-3e5f310a4510)

[CentOS USB](https://linuxize.com/post/how-to-create-a-bootable-centos-7-usb-stick-on-linux)

[Container Runtimes](https://kubernetes.io/docs/setup/production-environment/container-runtimes/#docker)

[Create Cluster Kubeadm](https://www.digitalocean.com/community/tutorials/how-to-create-a-kubernetes-cluster-using-kubeadm-on-centos-7)

[Kubernetes With Firewalld](https://medium.com/platformer-blog/kubernetes-on-centos-7-with-firewalld-e7b53c1316af)

[Calico Quickstart](https://docs.projectcalico.org/v3.9/getting-started/kubernetes/)

[Helm Quickstart](https://helm.sh/docs/using_helm/#quickstart-guide)

[Vagrant Docs](https://www.vagrantup.com/docs/)

[Cert Manager Chart](https://github.com/jetstack/cert-manager/tree/master/deploy/charts/cert-manager)

[Drone Chart](https://github.com/helm/charts/tree/master/stable/drone)

[Ingress Chart](https://github.com/helm/charts/tree/master/stable/nginx-ingress)

[Local Path Provisioner Chart](https://github.com/rancher/local-path-provisioner/tree/master/deploy/chart)

[Loki Chart](https://github.com/grafana/loki/tree/master/production/helm/loki)

[Promtail Chart](https://github.com/grafana/loki/tree/master/production/helm/promtail)

[Metallb Chart](https://github.com/helm/charts/tree/master/stable/metallb)

[MongoDB Chart](https://github.com/helm/charts/tree/master/stable/mongodb)

[PostgresSQL Chart](https://github.com/helm/charts/tree/master/stable/postgresql)

[Prometheus Chart](https://github.com/helm/charts/tree/master/stable/prometheus-operator)
