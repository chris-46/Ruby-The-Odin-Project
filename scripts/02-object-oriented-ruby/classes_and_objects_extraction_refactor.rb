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

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end

  def initialize
    @@number_of_vehicles += 1
  end
end

class MyTruck < Vehicle
  include Towable
  NUMBER_OF_DOORS = 2
end

class MyCar < Vehicle
  include SprayPaint

  NUMBER_OF_DOORS = 4

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

  def to_s
    "My car is a #{color}, #{year}, #{@model}!"
  end

end

# Results:
# irb(main):001> load "./classes_and_objects_I.rb"
# => true
# irb(main):002> d = MyCar.new(2020,"VW Golf GTI", "Black")
# => #<MyCar:0x000001be94949bf8 @color="Black", @current_speed=0, @engine_state="off", @model="VW Golf GTI", @year=2020>
# irb(main):003> d.year
# => 2020
# irb(main):004> d.model
# => "VW Golf GTI"
# irb(main):005> d.color
# => "Black"
# irb(main):006> d.engine_state
# => "off"
# irb(main):007> d.current_speed
# => 0
# irb(main):008> d.start_engine
# => "on"
# irb(main):009> d.engine_state
# => "on"
# irb(main):010> d.speed_up(50)
# => 50
# irb(main):011> d.current_speed
# => 50
# irb(main):012> d.brake(20)
# => 30
# irb(main):013> d.current_speed
# => 30
# irb(main):014> d.spray_paint("Candy Purple")
# => "Candy Purple"
# irb(main):015> d.color
# => "Candy Purple"


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

# Inheritance Q7
# puts "Well done!" if joe.better_grade_than?(bob)

# ANS:
# class Student
#   def initialize(name, grade)
#     @name = name
#     @grade = grade
#   end

#   def better_grade_than?(other_student)
#     grade > other_student.grade
#   end

#   protected

#   def grade
#     @grade
#   end
# end

# joe = Student.new("Joe", 90)
# bob = Student.new("Bob", 84)
# puts "Well done!" if joe.better_grade_than?(bob)

# Inheritance Q8
# bob = Person.new
# bob.hi

# ERROR:
# NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
# from (irb):8
# from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

# FIX: move the hi method outside (i.e. above) the private method call in the class.