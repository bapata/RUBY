#!/usr/bin/ruby

# Utility to convert a zone transfer format file (input) to character separated values (example: csv)
# USage: <this-script> <axfr-format-file> [separator (default=comma)]

# Zonefile := <Resourcerecords>*
# Resourcerecords := A|CNAME|TXT|MX|HINFO

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
        elsif (line =~ /(\s+)(HINFO)(\s+)/)
          hinfo_obj = RR_hinfo.new(line)
          @rr_entries.push(hinfo_obj)
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

# Base class common for most resource_records
class Resourcerecord
  protected
  attr_accessor :name, :type, :value

  public
  def initialize(line)
    line_parts=line.split()
    @name,@type,@value=line_parts[0],line_parts[3],line_parts[4]
  end

  def to_any_sv(sep)
    print "\n#{name}#{sep}#{type}#{sep}#{value}"
  end
end


class RR_a < Resourcerecord
  # Code is in base class, no overriding required
end

class RR_cname < Resourcerecord
  # Code is in base class, no overriding required
end

# Special handling of 'value' field for MX
class RR_mx < Resourcerecord
  def initialize(line)
    # When you invoke super with no arguments Ruby sends a message to the parent of the current object, 
    # asking it to invoke a method of the same name as the method invoking super. It automatically forwards 
    # the arguments that were passed to the method from which it's called.
    super
    # Now override just 'value' attribute in base class
    line_parts=line.split();
    #      <weight>              <mail-server>
    @value=line_parts[4] + " " + line_parts[5]
  end
end

class RR_txt < Resourcerecord
  # Code is in base class, no overriding required
end

class RR_hinfo < Resourcerecord
  # Code is in base class, no overriding required
end

# Helper function
def usage()
  print "\nUSAGE: #{$0} <axfr-file-name> [separator-char]\n"
end

# Main function
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

# 
## Main starts here
#
if __FILE__ == $0
    main(ARGV)
end

