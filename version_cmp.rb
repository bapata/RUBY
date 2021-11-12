#!/usr/bin/env ruby

def ver_cmp(version1,version2)
  v_int_lista=version1.split(".").map { |x| x.to_i() }
  v_int_listb=version2.split(".").map { |x| x.to_i() }
  lena=v_int_lista.length()
  lenb=v_int_listb.length()
  minab=lena<lenb ? lena:lenb
  ii=0
  while(ii<minab)
    if v_int_lista[ii]!=v_int_listb[ii]
      break
    end
    ii=ii+1
  end
  if ii<minab
  then
    return v_int_lista[ii]-v_int_listb[ii]
  elsif ii==minab
  then
    if lena>minab
    then
      return 1
    elsif (lenb > minab)
    then
      return -1
    else
      return v_int_lista[minab-1]-v_int_listb[minab-1]
    end
  end
  return 9999
end

def main()
  if ARGV.length()!=2
    puts "\nUSAGE: ./this-script <version-string1> <version-string2>\n"
    exit(-1)
  end
  v1=ARGV[0]
  v2=ARGV[1]
  res=ver_cmp(v1,v2)
  if res>0
  then
    puts v1 + " greater than " + v2
  elsif res<0
  then
    puts v1 + " less than " + v2
  else
    puts v1 + " is equal to " + v2
  end

end

main()
