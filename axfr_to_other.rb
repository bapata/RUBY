#!/usr/bin/ruby

class Zonefile
      attr_writer :_rr_entries 

    def initialize(axfr_file_name)
      _rr_entries = new ResourceRecord(1)
    end
    def build(rr_line)
      line_elements = rr.line.split()
      print line_elements
    end
end

class Resourcerecord
  attr_accessor :name, :type, :value
  def initialize(name,type,value)
    @name,@type,@value=name,type,value
  end

  def to_csv()
    print "#{name},#{type},#{value}"
  end
end


class RR_a < Resourcerecord
  def initialize(name,type,value)
    super(name,type,value)
  end
end

class RR_cname < Resourcerecord
  def initialize(name,type,value)
    super(name,type,value)
  end
  def to_csv()
    super()    
  end
end

class RR_mx < Resourcerecord
  def initialize(name,type,value)
    super(name,type,value)
  end
  def to_csv()
    super()    
  end
end

class RR_txt < Resourcerecord
  def initialize(name,type,value)
    super(name,type,value)
  end
  def to_csv()
    super()    
  end
end

class RR_hinfo < Resourcerecord
  def initialize(name,type,value)
    super(name,type,value)
  end
  def to_csv()
    super()    
  end
end

def main()
  zf = new Zonefile(ARGV)
end

if __FILE__ == $0
    main()
end
