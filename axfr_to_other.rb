#!/usr/bin/ruby

class Zonefile

    def initialize(axfr_file_name,separator)
      @rr_entries = []
      @sep=separator

      # Walk file and constructing list of objects
      File.open(axfr_file_name).each do |line|
        line.chomp!()

        if (line =~ /(\s+)(A)(\s+)/)
          a_obj = RR_a.new(line)
          @rr_entries.push(a_obj)
        elsif (line =~ /(\s+)(CNAME)(\s+)/)
          cname_obj = RR_cname.new(line)
          @rr_entries.push(cname_obj)
        elsif (line =~ /(\s+)(TXT)(\s+)/)
          txt_obj = RR_txt.new(line)
          @rr_entries.push(txt_obj)
        elsif (line =~ /(\s+)(MX)(\s+)/)
          mx_obj = RR_mx.new(line)
          @rr_entries.push(mx_obj)
        else
          ; # Do nothing for other Resource records
        end
      end
    end

    def to_any_sv()
      @rr_entries.each do |obj|
         obj.to_any_sv(@sep)
       end
      print "\n"
    end

end

class Resourcerecord
  protected
  attr_accessor :name, :type

  public
  def initialize(line)
    line_parts=line.split()
    #(@name,@type,@value)=line_parts[0],line_parts[3],line_parts[4]
    (@name,@type)=line_parts[0],line_parts[3]
  end

  def to_any_sv(sep)
    #print "\n#{name},#{type},#{value}"
    print "\n#{name}#{sep}#{type}"
  end
end


class RR_a < Resourcerecord
  protected
  attr_accessor :value

  public
  def initialize(line)
    super(line)
    @value=line.split()[4];
  end
  def to_any_sv(sep=",")
    super(sep)    
    print "#{sep}#{value}"
  end
end

class RR_cname < Resourcerecord
  protected
  attr_accessor :value

  public
  def initialize(line)
    super(line)
    @value=line.split()[4];
  end
  def to_any_sv(sep=",")
    super(sep)    
    print "#{sep}#{value}"
  end
end

class RR_mx < Resourcerecord
  protected
  attr_accessor :value

  public
  def initialize(line)
    # Override
    super(line)
    line_parts=line.split();
    @value=line_parts[4] + " " + line_parts[5]
  end
  def to_any_sv(sep=",")
    super(sep)    
    print "#{sep}#{value}"
  end
end

class RR_txt < Resourcerecord
  protected
  attr_accessor :value

  public
  def initialize(line)
    super(line)
    @value=line.split()[4];
  end
  def to_any_sv(sep=",")
    super(sep)    
    print "#{sep}#{value}"
  end
end

class RR_hinfo < Resourcerecord
  protected
  attr_accessor :value

  public
  def initialize(line)
    super(line)
    @value=line.split()[4];
  end
  def to_any_sv(sep=",")
    super(sep)    
    print "#{sep}#{value}"
  end
end

def usage()
  print "\nUSAGE: #{$0} <axfr-file-name> [separator-char]\n"
end

def main(arg_array)
  (axfr_file_name,separator) = arg_array[0..1]

  if(!axfr_file_name)
    usage()
    exit(0)
  end
  separator = separator ? separator : ","
  zf = Zonefile.new(axfr_file_name,separator)
  zf.to_any_sv()
end

if __FILE__ == $0
    main(ARGV)
end
