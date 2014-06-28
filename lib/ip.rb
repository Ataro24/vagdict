module VagDict

class IpConsult
  def initialize(dict_path)
    @dict_file = dict_path
    @dict      = IpDictionary.new(dict_path)
    @ip_map    = @dict.load
  end

  def load_ipaddr(vmname)
    if @ip_map[vmname].nil?
      @ip_map[vmname] = generate_ipaddr(vmname)
    end
    @ip_map[vmname]
  end

  # generate ipaddr and write Dictionary
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
    @dict.save(vmname, new_ip)
    new_ip
  end

  class IpDictionary
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
