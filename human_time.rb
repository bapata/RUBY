# Script to convert seconds to human readable time

def to_time_str(seconds)
  mm,ss = seconds.divmod(60)
  hh,mm = mm.divmod(60)
  dd,hh = hh.divmod(24)
  return "%d days, %d hours %d minutes %d seconds" % [dd,hh,mm,ss]
end

# Main starts here. USAGE: ./human_time.rb <seconds>

seconds,=ARGV[0].to_i()
my_str = to_time_str(seconds)
puts my_str + "\n"
