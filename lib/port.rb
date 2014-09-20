module VagDict

class PortConsult
  def initialize(base=nil)
    @base = base || 2222
  end

  def generate_forwardport(ipaddr)
    a,b,c,d = ipaddr.split('.').map{|s| s.to_i}
    if d.nil?
      puts "invalid ip addr -> ipaddr:#{ipaddr}"
      exit
    end
    @base + d
  end

end

end
