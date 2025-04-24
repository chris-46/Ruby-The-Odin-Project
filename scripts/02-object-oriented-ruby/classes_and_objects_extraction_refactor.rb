# > Classes and Objects I
# instance vars: year, color, model, current_speed init. to 0
# instance methods: speed_up, brake, shut_engine
# accessors: view & change car color (SprayPaint)
# readers: year

# > Classes and Objects II
# calculate gas mileage (i.e. miles per gallon) of any car.
# Override the to_s method to create a user friendly print out of your object.

# > Inheritance
# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass.
# - Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.
# Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.
# Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.
# Print to the screen your method lookup for the classes that you have created. (my_class.ancestors)
# > Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class. Make sure that all of your previous method calls are working when you are finished.
# > Write a method called age that calls a private method to calculate the age of the vehicle. Make sure the private method is not available from outside of the class. You'll need to use Ruby's built-in Time class to help.


module SprayPaint
  def spray_paint(new_color)
    self.color = new_color
  end
end

module Towable
  def can_tow?(pounds)
    pounds < 2000 # All Towables apparently can only tow up to 2000 lbs
  end
end

class Vehicle
  @@number_of_vehicles = 0


  attr_accessor :color
  attr_reader :year, :model, :current_speed, :engine_state

  def initialize(y, m, c)
    @year = y
    @model = m
    @color = c
    @current_speed = 0
    @engine_state = 'off'
    @@number_of_vehicles += 1
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

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2

  def to_s
    "My truck is a #{color}, #{year}, #{@model}!"
  end
end

class MyCar < Vehicle
  include SprayPaint
  NUMBER_OF_DOORS = 4

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end
end

# MyCar
d = MyCar.new(2020, 'VW Golf GTI', 'Black')
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

d.spray_paint('Candy Purple') # => "Your new Candy Purple paint job looks great!"
puts d.color # => "Candy Purple"

# MyTruck (no spray_paint)
t = MyTruck.new(2018, 'Toyota Tacoma', 'Silver')
puts t.year           # => 2018
puts t.model          # => "Toyota Tacoma"
puts t.color          # => "Silver"
puts t.engine_state   # => "off"
puts t.current_speed  # => 0

t.start_engine        # => "on"
puts t.engine_state   # => "on"

t.speed_up(40)        # => 40
puts t.current_speed  # => 40

t.brake(15)           # => 25
puts t.current_speed  # => 25

# Towing test (from Towable module)
puts t.can_tow?(1500) # => true
puts t.can_tow?(2500) # => false




# Inheritance Q7
# puts "Well done!" if joe.better_grade_than?(bob) -> Make this work!
class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  attr_reader :grade
end

joe = Student.new('Joe', 90)
bob = Student.new('Bob', 84)
puts 'Well done!' if joe.better_grade_than?(bob)

# Inheritance Q8
# bob = Person.new
# bob.hi

# ERROR:
# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# FIX: move the hi method outside (i.e. above) the private method call in the class.
