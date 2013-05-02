class Month

    attr_accessor :month, :year

    def initialize (month, year)
        @month = month
        @year = year
    end 

    def month_name
        month_names = ['January','February','March','April','May','June','July','August','September','October','November','December']
        month_names[@month - 1]
    end

    def num_of_days
         days_in_month=[31,28,31,30,31,30,31,31,30,31,30,31]
      if @month - 1 == 1 && leap_year?
         return 29
      else
         days_in_month[@month - 1]
      end
    end
    
    def start_day
             q = 1
             month = @month
             yr = @year
          if month == 1 || month == 2 # if month equal 1 or 2 make mothe 13 or 14 it represents January and February in Zeller's algorithm
             month += 12
             yr = @year - 1
         end 
            #Zeller's congruence http://en.wikipedia.org/wiki/Zeller's_congruence
             start_num = (q + ((month + 1)*26  / 10) + yr + (yr / 4) + (6*(yr / 100)) + (yr / 400)) % 7
          if start_num == 0
             start_num = 7
         end 
             start_num
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

    def month_year_header
       " #{month_name} #{@year}".center(20).rstrip
    end 

    def day_header
       "Su Mo Tu We Th Fr Sa" 
    end 

    # def format_cal
    # end

    # def print_cal
    # end 

end 