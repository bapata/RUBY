#!/usr/bin/env ruby

# Object oriented implementation
class VersionStr
  public
    # Initialize the name
    def initialize(v)
        @ver_str=v
    end
    def <=>(obj)
        return ver_cmp(self.getver(),obj.getver())
    end
    def getver()
      return @ver_str
    end


  private
    attr_accessor:ver_str
     
    # Private method for comparing 2 string versions
    def ver_cmp(v1,v2)
      v_intlist1=v1.split(".").map { |x| x.to_i() }
      v_intlist2=v2.split(".").map { |x| x.to_i() }
      lena=v_intlist1.length()
      lenb=v_intlist2.length()
      minab=lena<lenb ? lena:lenb
      ii=0
      while(ii<minab)
        if v_intlist1[ii]!=v_intlist2[ii]
          break
        end
        ii=ii+1
      end
      if ii<minab
      then
        return (v_intlist1[ii]-v_intlist2[ii])
      elsif ii==minab
      then
        if lena>minab
        then
          return 1
        elsif (lenb > minab)
        then
          return -1
        else
          return v_intlist1[minab-1]-v_intlist2[minab-1]
        end
      end
        return 9999
    end # ver_cmp
end # Class


def main()
  if ARGV.length()!=2
    puts "\nUSAGE: ./this-script <version-string1> <version-string2>\n"
    exit(-1)
  end
  v1=VersionStr.new(ARGV[0])
  v2=VersionStr.new(ARGV[1])

  # Invoke overloaded operator
  res = v1<=>v2

  if res>0
  then
    puts v1.getver() + " greater than " + v2.getver()
  elsif res<0
  then
    puts v1.getver()+ " less than " + v2.getver()
  else
    puts v1.getver()+ " is equal to " + v2.getver()
  end

end

main()
