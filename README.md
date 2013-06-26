NSS-Cal
=======

##Goal
The goal of this project was to implement a Ruby program that mimics the Unix Cal command.  A project for the Nashville Software School

##Features
* Displays single month when given a month number and year
* Displays twelve months when just given a year
* Displays single month from 2012 when just given a month

##How to Use
```ruby
ruby cal.rb 3 2012
```

where 3 is the month and 2012 is the year

##Limitations
Only works for years 1800-3000

##Dependencies
None

##File Structure
+ **cal.rb** - logic for parsing parameters
+ **month.rb** - the Month class
+ **year.rb** - the Year class

##Bugs
No known bugs.

==List of Methods:

1. month_name
2. num_of_days
3. zeller_algorithm
4. leap_year?
5. month_year_header
6. day_header
7. format_month
8. print_month
