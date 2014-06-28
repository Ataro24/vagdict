module VagDict

class BoxConsult
  def initialize(dict_path)
    @dict_file = dict_path
    @dict      = BoxDictionary.new(dict_path)
    @box_map   = @dict.load
  end

  def load_boxurl(boxname)
    if @box_map[boxname].nil?
      puts "not found box url -> boxname:#{boxname} dict_file:#{@dict_file}"
      exit
    end
    @box_map[boxname]
  end

  class BoxDictionary
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
