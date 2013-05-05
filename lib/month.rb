class Month

    attr_accessor :month, :year

    def initialize (month, year)
        @month = month
        @year = year
    end 

    def month_name
        monthNames = {1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April', 5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August', 9 => 'September', 10 => 'October', 11 => 'November', 12 =>'December'}
        monthNames[@month]
    end 

    # def month_name
    #     month_names = ['January','February','March','April','May','June','July','August','September','October','November','December']
    #     month_names[month - 1]
    # end

    def num_of_days
         days_in_month=[31,28,31,30,31,30,31,31,30,31,30,31]
      if @month - 1 == 1 && leap_year?
         return 29
      else
         days_in_month[@month - 1]
      end
    end
    
    def zeller_algorithm 
           q = 1
           month = @month
           yr = @year
          if month == 1 || month == 2 # if month equal 1 or 2 make them 13 or 14 it represents January and February in Zeller's algorithm
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
     "#{month_name} #{@year}"
    end 

    def day_header
     "Su Mo Tu We Th Fr Sa" 
    end 

    def format_month
        start_day = zeller_algorithm-1
        layout = " "
        start_day.times do layout.prepend("   ") end 
        layout += (1..9).to_a.join("  ")
        layout += " "
        layout += (10..num_of_days).to_a.join(" ")
        new_layout = layout.scan(/.{1,21}/)
        new_layout.each  {|x| x.rstrip!}
        new_layout
    end
    
    def print_month 
        first_line = month_year_header.center(20)
        second_line = day_header
        format_month.unshift(second_line).unshift(first_line)
    end

end 
