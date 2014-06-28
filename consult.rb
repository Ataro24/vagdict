$LOAD_PATH << File.dirname(__FILE__)
require 'lib/ip'
require 'lib/box'

module VagDict

class Consult
  def self.get_vmname()
    here = Dir::pwd
    name = here.split("/").last
    name
  end

  def self.get_ip(vmname, dict)
    IpConsult.new(dict).load_ipaddr(vmname)
  end

  def self.get_boxurl(boxname, dict)
    BoxConsult.new(dict).load_boxurl(boxname)
  end

  def conf_exist?(path)
    File.exist?(path)
  end

end

end
