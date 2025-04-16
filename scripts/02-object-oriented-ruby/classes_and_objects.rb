# > Classes and Objects I
# Create a class called MyCar. 
# - When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. 
# - Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. 
# - Create instance methods that allow the car to speed up, brake, and shut the car off.

# Add an accessor method to your MyCar class to change and view the color of your car. 
# Then add an accessor method that allows you to view, but not modify, the year of your car.


# You want to create a nice interface that allows you to accurately describe the action you want your program to perform. 
# - Create a method called spray_paint that can be called on an object and will modify the color of the car.


# instance vars: year, color, model, current_speed init. to 0
# instance methods: speed_up, brake, shut_engine
# accessors: view & change car color
# readers: year

# > Classes and Objects II
# Add a class method to your MyCar class that calculates the gas mileage (i.e. miles per gallon) of any car.
# Override the to_s method to create a user friendly print out of your object.

module SprayPaint
  def spray_paint(new_color)
    self.color = new_color
  end
end

class MyCar
  include SprayPaint

  attr_accessor :color
  attr_reader :year, :model, :current_speed, :engine_state
  
  def initialize(y, m, c)
    @year = y
    @model = m
    @color = c
    @current_speed = 0
    @engine_state = 'off'
  end

  def speed_up(increase_by)
    @current_speed = current_speed + increase_by
  end

  def brake(decrease_by)
    @current_speed = current_speed - decrease_by
  end

  def start_engine
    @engine_state = 'on'
  end

  def shut_engine
    @engine_state = 'off'
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end

end

# Test Run:
d = MyCar.new(2020, "VW Golf GTI", "Black")
puts d.year           # => 2020
puts d.model          # => "VW Golf GTI"
puts d.color          # => "Black"
puts d.engine_state   # => "off"
puts d.current_speed  # => 0

d.start_engine        # => "on"
puts d.engine_state   # => "on"

d.speed_up(50)        # => 50
puts d.current_speed  # => 50

d.brake(20)           # => 30
puts d.current_speed  # => 30

d.spray_paint("Candy Purple") # => "Your new Candy Purple paint job looks great!"
puts d.color          # => "Candy Purple"



# Classes and Objects II Q3
# class Person
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end
# end

# bob = Person.new("Steve")
# bob.name = "Bob"

# ERROR:
# test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
  
# line 107 is a no method error since @name the instance variable is read-only and has no getter defined via attr_reader.
# Change to attr_writer or attr_accessor to fix.