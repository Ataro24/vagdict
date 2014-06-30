# Usage
## getting vm hostname and ip address
```ruby:Vagrantfile
require "path/to/vagdict/consult.rb"

vm_name = VagDict::Consult.get_vmname
vm_ip   = VagDict::Consult.get_ip(vm_name, "path/to/ip_conf_file")
```
```:ip_conf_file
__base 192.168.33.x
vm1 192.168.33.2
```
+ __base is keyword that appoints IP range.
+ If hostname is not found in ip_conf_file, Vagdict generates IP Address for the hostname and writes it in ip_conf_file.

## getting vagrant box url from config file
```ruby:Vagrantfile
require "path/to/vagdict/consult.rb"

box_name = "Vagrant_box_name"
box_url  = VagDict::Consult.get_boxurl(box_name, "path/to/box_conf_file")
```
```:box_conf_file
centos http://hogehoge.fuga/centos.box
```
