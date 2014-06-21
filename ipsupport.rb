module VagrantSupport

class IpSupport
  def initialize(conf_path)
    @conf_file = conf_path
    @conf      = Configure.new(conf_path)
    @ip_map    = @conf.load
  end

  def load_ipaddr(vmname)
    if @ip_map[vmname].nil?
      @ip_map[vmname] = generate_ipaddr(vmname)
    end
    @ip_map[vmname]
  end

  # generate ipaddr and write conf
  # return generated ipaddr
  def generate_ipaddr(vmname)
    new_ip = ""
    base_ip = @ip_map["__base"]
    for i in 2...255 # can not use 0,1
      candidate = base_ip.gsub(/x/, "#{i}")
      if @ip_map.find{|name, ipaddr| ipaddr == candidate}.nil?
        new_ip = candidate
        break
      end
    end
    @conf.save(vmname, new_ip)
    new_ip
  end

  class Configure
    def initialize(path)
      @path = path
    end

    def load
      records = {}
      File.open(@path) do |file|
        while l = file.gets
          name, ipaddr = l.chomp.split(" ")
          records[name] = ipaddr unless name.nil?
        end
      end
      records
    end

    def save(vmname,ipaddr)
      File.open(@path, "a") do |file|
        file.puts "#{vmname} #{ipaddr}"
      end
    end

  end

end

end
