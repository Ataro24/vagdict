$LOAD_PATH << File.dirname(__FILE__)
require 'ipsupport'
require 'boxsupport'

module VagrantSupport

class Supporter
  def self.get_vmname()
    here = Dir::pwd
    name = here.split("/").last
    name
  end

  def self.get_ip(vmname, conf)
    IpSupport.new(conf).load_ipaddr(vmname)
  end

  def self.get_boxurl(boxname, conf)
    BoxSupport.new(conf).load_boxurl(boxname)
  end

  def conf_exist?(path)
    File.exist?(path)
  end

end

end
