class Month

    attr_accessor :year

    def initialize (year)
        @year = year
    end 

    def leap_year?
        if @year % 400 == 0 # if year is divisible by 400 then is leap year
            return true 
        elsif @year % 100 == 0 # if year is divisible by 100 then not leap year
            return false 
        elsif @year % 4 == 0 # if year is divisible by 4 then is leap year 
            return true 
        else 
            return false # not a leap year
        end 
    end 
end 