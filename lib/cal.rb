require 'month'


  def cal_header
    month = ARGV[0]
    year = ARGV[1]
    puts `cal #{month} #{year}`
  end 



