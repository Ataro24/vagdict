module VagrantSupport

class BoxSupport
  def initialize(conf_path)
    @conf_file = conf_path
    @conf      = Configure.new(conf_path)
    @box_map   = @conf.load
  end

  def load_boxurl(boxname)
    if @box_map[boxname].nil?
      puts "not found box url -> boxname:#{boxname} conf_file:#{@conf_file}"
      exit
    end
    @box_map[boxname]
  end

  class Configure
    def initialize(path)
      @path = path
    end

    def load
      records = {}
      File.open(@path) do |file|
        while l = file.gets
          name, url = l.chomp.split(" ")
          records[name] = url unless url.nil?
        end
      end
      records
    end

  end

end

end
