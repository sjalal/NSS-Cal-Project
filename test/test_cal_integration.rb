require 'test/unit'
require 'cal'

class CalendarProjectTest < Test::Unit::TestCase

    # def test_01
    #    assert_equal `cal 2 2013`, `ruby cal.rb 2 2013`
    # end
 
    def test_02a_leap_year_if_400
       yr1 = Month.new(2000)
       yr2 = Month.new(2400)
       assert_equal(true, yr1.leap_year?)
       assert_equal(true, yr2.leap_year?)
    end 

    def test_02b_leap_year_if_100
       yr1 = Month.new(1800)
       yr2 = Month.new(2100) 
       assert_equal(false, yr1.leap_year?)
       assert_equal(false, yr2.leap_year?)
    end 

    def test_02c_leap_year_if_4
       yr1 = Month.new(2016)
       yr2 = Month.new(2000)
       assert_equal(true, yr1.leap_year?)
       assert_equal(true, yr2.leap_year?)
    end
    
    def test_02d_leap_year_if_random
       yr1 = Month.new(1983)
       yr2 = Month.new(2487)
       yr3 = Month.new(2400)
       assert_equal(false, yr1.leap_year?)
       assert_equal(false, yr2.leap_year?)
       assert_equal(true, yr3.leap_year?)
    end 

end
