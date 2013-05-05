require 'test/unit'
require 'cal'

class CalendarProjectTest < Test::Unit::TestCase

     def test_01a_full_calendar_output
        assert_equal (`cal 2 2013`, `ruby cal.rb 2 2013`)
     end

     def test_01b_full_calendar_output_when_leap_year
        assert_equal (`cal 2 2000`, `ruby cal.rb 2 2000`)
     end

     def test_01c_full_calendar_output_if_random
        assert_equal (`cal 2 2000`, `ruby cal.rb 2 2000`)
        assert_equal (`cal 2 2011`, `ruby cal.rb 2 2011`)
        assert_equal (`cal 2 3000`, `ruby cal.rb 2 3000`)
     end

    def test_02_month_name
      cal1 = Month.new(3,2012)
      cal2 = Month.new(4,2012)
      cal3 = Month.new(7,2012)
      assert_equal("March", cal1.month_name)
      assert_equal("April", cal2.month_name)
      assert_equal("July", cal3.month_name)
    end

    def test_03_num_of_day_in_month
      cal1 = Month.new(1,2013)
      cal2 = Month.new(7,2013)
      assert_equal(31, cal1.num_of_days)
      assert_equal(31, cal2.num_of_days)
    end

    def test_03a_february_num_of_day_when_leap_year
      cal = Month.new(2,2012)
      assert_equal(29, cal.num_of_days)
    end

    def test_03b_february_num_of_day_when_not_leap_year
      cal = Month.new(2,2011)
      assert_equal(28, cal.num_of_days)
    end

    def test_04a_leap_year_if_400
       cal1 = Month.new(2,2000)
       cal2 = Month.new(2,2400)
       assert_equal(true, cal1.leap_year?)
       assert_equal(true, cal2.leap_year?)
    end 

    def test_04b_leap_year_if_100
       cal1 = Month.new(2,1800)
       cal2 = Month.new(2,2100) 
       assert_equal(false, cal1.leap_year?)
       assert_equal(false, cal2.leap_year?)
    end 

    def test_04c_leap_year_if_4
       cal1 = Month.new(2,2016)
       cal2 = Month.new(2,2000)
       assert_equal(true, cal1.leap_year?)
       assert_equal(true, cal2.leap_year?)
    end
    
    def test_04d_leap_year_if_random
       cal1 = Month.new(2,1983)
       cal2 = Month.new(2,2487)
       cal3 = Month.new(2,2400)
       assert_equal(false, cal1.leap_year?)
       assert_equal(false, cal2.leap_year?)
       assert_equal(true, cal3.leap_year?)
    end 

    def test_05a_zeller_non_leap_year
        cal1 = Month.new(5,2013)
        cal2 = Month.new(2,2014)
        cal3 = Month.new(3,2030)
        assert_equal(4,cal1.zeller_algorithm)
        assert_equal(7,cal2.zeller_algorithm)
        assert_equal(6,cal3.zeller_algorithm)
    end

    def test_05b_zeller_leap_year
        cal1 = Month.new(9,2012)
        cal2 = Month.new(4,2016)
        assert_equal(7,cal1.zeller_algorithm)
        assert_equal(6,cal2.zeller_algorithm)
    end

    def test_06_print_month_name_and_year
        cal1 = Month.new(9,2012)
        cal2 = Month.new(4,2016)
        assert_equal("September 2012",cal1.month_year_header)
        assert_equal("April 2016",cal2.month_year_header)
    end

    def test_07_print_days_of_the_week
        cal = Month.new(4,2013)
        assert_equal("Su Mo Tu We Th Fr Sa",cal.day_header)
    end   

#  def test_08_month_layout
#     layout = <<EOS
#    September 2012
# Su Mo Tu We Th Fr Sa
#                    1
#  2  3  4  5  6  7  8
#  9 10 11 12 13 14 15
# 16 17 18 19 20 21 22
# 23 24 25 26 27 28 29
# 30 
# EOS
#     cal = Month.new
#     assert_equal(layout, cal.print_month(9,2012))
#   end

    def test_08_month_layout
        cal = Month.new(9,2012)
        layout = []
        layout << "   September 2012   "
        layout << "Su Mo Tu We Th Fr Sa"
        layout << "                   1"
        layout << " 2  3  4  5  6  7  8"
        layout << " 9 10 11 12 13 14 15"
        layout << "16 17 18 19 20 21 22"
        layout << "23 24 25 26 27 28 29"
        layout << "30"
        assert_equal(layout,cal.print_month)
    end

end
