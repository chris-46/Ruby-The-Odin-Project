# Create a class called MyCar. 
# - When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. 
# - Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. 
# - Create instance methods that allow the car to speed up, brake, and shut the car off.

# - Add an accessor method to your MyCar class to change and view the color of your car. 
# - Then add an accessor method that allows you to view, but not modify, the year of your car.


# You want to create a nice interface that allows you to accurately describe the action you want your program to perform. 
# - Create a method called spray_paint that can be called on an object and will modify the color of the car.


# instance vars: year, color, model, current_speed init. to 0
# instance methods: speed_up, brake, shut_engine
# accessors: view & change car color
# readers: year

module SprayPaint
  def spray_paint(new_color)
    self.color = new_color
  end
end

class MyCar
  attr_accessor :color
  attr_reader :year, :model, :current_speed, :engine_state
  
  def initialize(y, m, c)
    @year = y
    @model = m
    @color = c
  end

  def current_speed
    @current_speed || 0
  end

  def engine_state
    @engine_state || 'off'
  end

  def speed_up(increase_by)
    current_speed = current_speed + increase_by
  end

  def brake(decrease_by)
    current_speed = current_speed - increase_by
  end

  def start_engine
    @engine_state = 'on'
  end

  def shut_engine
    @engine_state = 'off'
  end

end