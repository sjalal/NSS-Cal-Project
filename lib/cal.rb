require_relative 'month'
require_relative 'year'

  # def cal_header
  #   month = ARGV[0]
  #   year = ARGV[1]
  #   puts `cal #{month} #{year}`
  # end 

if  ARGV.length == 1
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  puts Month.new(month, year).print_month
end




