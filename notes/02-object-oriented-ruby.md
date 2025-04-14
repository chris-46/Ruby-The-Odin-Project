<h1 align="center"> The Object Model </h1>

- This first section will be an introduction to OOP in Ruby, particularly why we should use OOP and important concepts in OOP.
- [Source Link](https://launchschool.com/books/oo_ruby/read/the_object_model#whyobjectorientedprogramming)

# Object Oriented Programming
Object Oriented Programming (OOP) is a programming [paradigm](https://en.wikipedia.org/wiki/Paradigm) that was created to deal with the growing complexity of large software systems.
- As applications grew in complexity and size, they became very difficult to maintain. 
- In OOP, areas of code that performed certain procedures are section off so that their programs could become the **interaction of many small parts**, as opposed to one massive blob of dependency.
  - As such, one small change at any point in the program would not trigger a ripple effect of errors due to dependencies throughout the entire program. 

# Encapsulation
Encapsulation describes the idea of bundling or combining the **states (data) and behaviors (operations)** that work together on that data into a **single entity**, e.g. an object.

Encapsulation also entails hiding functionality to make it unavailable to the rest of the codebase.
- Data protection is the main goal here, only with obvious intent can that data be manipulated.
- In Ruby, like other OO languages, achieves this by **creating objects** and **exposing public interfaces** (i.e. methods) to interact with those objects.

## Example: A Simple Banking Application
- The code for the app, at a minimum, must contain **data** about the bank accounts (account number, balance, account type) and the users (name, address, phone number). 
- The code must also contain **behaviors or operations** that use and manipulate that data. For instance, we should have operations that open an account, make withdrawals, and deposit new funds.
- One thing is evident here: the **data and operations** that you perform on your data are **related**.
  - You don't want to apply an operation intended for a bank account on a user's data. For example, it doesn't make much sense to withdraw funds from a user. Instead, you want to withdraw funds from the account, so you want to operate on an account.


# Polymorphism
Polymorphism is the ability for **different types of data** to respond to a **common interface**. 
- For instance, if we have a **method** that invokes the **move method** on its **argument**, we can pass the method **any type of argument** as long as the argument has a **compatible** move method. The object might represent a human, a cat, a jellyfish, or, conceivably, even a car or train. That is, it lets objects of different types respond to the same method invocation.

**"Poly"** stands for **"many"** and **"morph"** stands for **"forms"**. OOP gives us flexibility in using **pre-written code for new purposes**.

# Inheritance
The concept of inheritance is used in Ruby where **a class inherits** -- that is, acquires -- the **behaviors of another class**, referred to as the **superclass**. 
- Define basic classes with **large reusability** and smaller subclasses for more **fine-grained, detailed** behaviors.

Another way to apply **polymorphic** structure to Ruby programs is to use a **Module**. 
- Modules are similar to classes in that they **contain shared behavior**. However, you **cannot create an object** with a module. 
- A module must be **mixed in with a class** using the **include method invocation**. This is called a **mixin**. 
  - After mixing in a module, the behaviors declared in that module are available to the **class and its objects**.

`module Study`  
`end`

class MyClass  
&emsp;include Study  
end

my_obj = MyClass.new


# What are Objects?
In Ruby, everything is an object &rarr; Not exactly true!
- Anything that can be said to have a value **is** an object: that includes numbers, arrays, strings, and even classes and modules.
- However, **methods, blocks, and variables** stand out.

Note that **objects are created from classes.**
- Classes are molds and objects are the cast formed of the mold. 
- Two individual objects may contain different information from other objects, yet are instances of the same class.

Example:   
irb :001 > "hello".class  
=> String  
irb :002 > "world".class  
=> String  

# Classes Define Objects
Ruby defines the attributes and behaviors of its objects in classes. You can think of classes as **basic outlines** of what an object should be **made of** and what it should be able to **do**. 

To **define** a class, we use syntax similar to defining a method. 
- We replace the def with **class** and use the **CamelCase** naming convention to create the name.   
- We then use the reserved word **end** to finish the definition. 
- Ruby **file names** should be in **snake_case**, and reflect the class name. Thus, in the below example, the file name is **good_dog.rb** and the class name is **GoodDog**.

class GoodDog  
end  

sparky = GoodDog.new

In the above example, we created an instance of our **GoodDog** class and stored it in the variable **sparky**. We now have an object. 

We say that sparky is an object or instance of class GoodDog. 

This entire workflow of **creating a new object or instance from a class** is called **instantiation**, so we can also say that we've instantiated an object called sparky from the class GoodDog. 

The terminology in OOP is something you'll eventually get used to, but the important fact here is that an **object** is **returned** by calling the **class method new**. Take a look at Figure 3 to visualize what we're doing.

![alt text](../images/class_instance_diagram.jpg "Class Instance Diagram")

As you can see, defining and creating a new instance of a basic class is simple. But before we go any further showing you how to create more elaborate classes, let's talk about modules briefly.

# Modules
Modules are another way to achieve polymorphism, describing a **collection** of behaviors that is usable in other classes via **mixins**.
- Use the **include** method invocation to mixin a module into a class.

Let's say we wanted our `GoodDog` class to have a speak method but we have other classes that we want to use a speak method with too. Here's how we'd do it.

`module Speak`  
&emsp;def speak(sound)  
&emsp;&emsp;puts sound  
&emsp;end  
`end`  

class GoodDog  
&emsp;`include Speak`  
end  

class HumanBeing  
&emsp;`include Speak`  
end  

sparky = GoodDog.new  
sparky.speak("Arf!")        # => Arf!  
bob = HumanBeing.new  
bob.speak("Hello!")         # => Hello!  

Note: 
- `sparky`, the GoodDog object, and `bob`, the HumanBeing object, both have access to the speak instance method. 
- "mixing in" the module Speak makes it as if we copy-pasted the speak method into the GoodDog and HumanBeing classes.

# Method Lookup
When you call a method, how does Ruby know where to look for that method? 
Ruby has a **distinct lookup path** that it follows each time a method is called. 

Let's use our program from above to see what the method lookup path is for our GoodDog class. We can use the ancestors method on any class to find out the method lookup chain.

module Speak  
&emsp;def speak(sound)  
&emsp;&emsp;puts "#{sound}"  
&emsp;end  
end  

class GoodDog  
&emsp;include Speak  
end  

class HumanBeing  
&emsp;include Speak  
end  

puts "---GoodDog ancestors---"  
puts GoodDog.ancestors  
puts ''  
puts "---HumanBeing ancestors---"  
puts HumanBeing.ancestors  

**The output looks like this:**  

---GoodDog ancestors---  
GoodDog  
Speak  
**Object**  
**Kernel**  
**BasicObject**  

---HumanBeing ancestors---  
HumanBeing  
Speak  
**Object**  
**Kernel**  
**BasicObject**  

The **Speak** module is placed right in **between our custom classes** (i.e., GoodDog and HumanBeing) and the **Object class** that comes with Ruby. 
- In **Inheritance** you'll see how the **method lookup chain works** when working with both **mixins** and **class inheritance**.

Since the **speak** method is not defined in the GoodDog class, the next place it looks is the **Speak** module. This continues in an **ordered, linear fashion,**  until the method is either **found**, or there are **no more places to look.**

<h1 align="center"> Classes and Objects - Part I </h1>

# States and Behaviors
As mentioned earlier, we use classes to create objects.

 When defining a class, we typically focus on two things: **state** and **behaviors**. 
 - **State** refers to the data associated to an individual object (which are tracked by instance variables). 
 - **Behaviors** are what objects are capable of doing.

For example, using our GoodDog class from earlier, we may want to create two GoodDog objects: one named "Fido" and one named "Sparky". 
- They are both GoodDog objects, but may contain different information, such as name, weight, and height. 
- We would use **instance variables** to track this information. 
- Instance variables are **scoped** at the **object (or instance) level**, and are how **objects** keep track of their **states**.

Even though they're two different objects, both are still **objects (or instances)** of class **GoodDog** and contain identical behaviors.
- Both GoodDog objects should be able to bark, run, fetch, and perform other common behaviors of good dogs &rarr; these behaviors are defined as **instance methods** in a class. 
- **Instance methods** defined in a class are available **to objects (or instances) of that class**.

In summary, **instance variables** keep track of **state**, and **instance methods** expose **behavior for objects**.

# Initializing a new Object: The `initialize` Constructor
Again, let's look at the `GoodDog` class from before, but let's start fresh and remove existing functionality from the previous chapter.

## gooddog.rb
class GoodDog  
&emsp;def `initialize`  
&emsp;&emsp;puts "This object was initialized!"  
&emsp;end  
end  

sparky = GoodDog.new        # => "This object was initialized!"

The `initialize` method gets called every time you create a new object. 
- We do indeed call the `new` method when we create an object, but calling the `new` **class method** eventually leads us to the `initialize` **instance method**.
- The difference between class methods and instance methods will be discussed later. 

In the above example, **instantiating a new** GoodDog object triggered the `initialize` method and resulted in the string being outputted. We refer to the `initialize` method as a **constructor**, because it is a special method that **builds the object** when a new object is **instantiated**. It gets triggered by the `new` class method.

In short:  
Instantiating an object using the `new` class method will trigger the `initialize` instance method, a **constructor** that **builds the object** when a new object is **instantiated**.

# Instance Variables
Now that we know how to use constructors in Ruby, let's create a **new object** and **instantiate it** with some state, like a name.

## good_dog.rb
class GoodDog  
&emsp;def initialize(`name`)  
&emsp;&emsp;`@name` = name  
&emsp;end  
end  

The **@name** variable is called an **instance variable**. 
- It exists as long as the object **instance exists** and it is one of the ways we tie data to objects. 
- It does not "die" after the initialize method is run. 
- It "lives on", to be referenced, until the object instance is destroyed. 

In the above example, our initialize method is defined with one parameter: **name**. You can pass arguments into the initialize method through the new method. Let's create an object using the GoodDog class from above:

sparky = GoodDog.new("Sparky")  

Here, the string **"Sparky"** is being passed from the new method through to the **initialize method**, and is assigned to the **local variable name**.
- Within the **constructor** (i.e., the initialize method), we then **set the instance variable @name to name**, which results in assigning the string "Sparky" to the @name instance variable.

The state for the object is tracked in the instance variable, @name. If we created another GoodDog object, for example, with fido = GoodDog.new('Fido'), then the @name instance variable for the fido object would contain the string "Fido". Every object's state is distinct, and instance variables are how we keep track.

## Composition and Aggregation
In OOP languages, composition and aggregation are design principles used to establish **relationships between classes**. 
- Both composition and aggregation involve using **instance variables** to hold **references to other objects**, but they differ in terms of the lifecycle and ownership of the objects involved.

### Composition - Container contains 1+ (composed) objects of other classes
Composition is a relationship where an object -- often called the **container** -- **contains** **one or more objects** of **other classes** as part of its state. 

In composition, the **contained -- composed --** objects are **tied directly to the container**.
 - The **lifetimes** of the **container and composed** objects are **dependent** on each other.
 - **Composed** objects are **created** when the **container is created** and **destroyed** when the **container is destroyed**.

In Ruby, composition is typically implemented using **instance variables** that are **initialized** via the **constructor** of the class. Here’s an example:

class Engine  
&emsp;def start  
&emsp;&emsp;puts "Engine starting..."  
&emsp;end  
end  

class Car  
&emsp;def `initialize`  
&emsp;&emsp;`@engine = Engine.new`  # Engine instance is created when Car is created  
&emsp;end  

&emsp;def start  
&emsp;&emsp;@engine.start  
&emsp;end  
end  

my_car = Car.new  
my_car.start  # Engine is an integral part of Car  

In this example, **Car has an Engine**, and **Car** instances **contain** an **Engine** object. 
- When the Car is instantiated, the Engine is also instantiated. 
- Likewise, when the Car object is destroyed, the composed Engine object is also destroyed.

We can say that a **container** has a **has-a** relationship to its **composed objects**. That is, the **container "has a" composed object**.

### Aggregation
Aggregation is a form of **association** that is **less tightly coupled than composition**. 
- Unlike composition, the **lifetime of the contained objects** does **not depend** on the **lifetime of the container**. 
- The **container** may have a **reference to the objects**, and it may** coordinate their operations**, but those objects typically exist **independently of the container**.

Here's an example:

class Passenger  
end

class Car  
&emsp;def `initialize(passengers)` # This means passengers existed before the Car  
&emsp;&emsp;@passengers = passengers  # Passengers are given to the Car at creation  
&emsp;end  
end  

\# Passengers can exist without Car  
`passengers = [Passenger.new, Passenger.new]`  
my_car = Car.new(passengers)

In this case, **Car instances have a list of Passenger objects**, but these Passenger objects can **exist independently** of the Car instance. 
They can be **passed to the Car object** when it's instantiated or any time before the Car instance is destroyed. However, the **Passenger objects will continue to live on** after the Car object is destroyed.

As with composed objects, we can say that a container has a **has-a relationship** to its aggregated objects. That is, the **container "has an" aggregated object.**

## Relation to Instance Variables
The relationships between a **container class instance** and its **composed and aggregated objects** is implemented with **instance variables**. 
- These **instance variables** hold **references to other objects**, enabling the container class to access and interact with the **contained objects' methods and propertie**s. 

The main difference lies in the **ownership and the lifecycle of the objects referenced** by these instance variables:
- `Composition`: The container **owns** the contained objects, and their **lifecycles are tightly linked**.
- `Aggregation`: The container **does not own** the contained objects; they can **exist independently.**

These concepts are fundamental in designing systems that are modular, where changes to one part of the system do not unduly affect others.

# Instance Methods
Right now, our GoodDog class can't really do anything. Let's give it some **behaviors**.

## good_dog.rb  
class GoodDog  
&emsp;def initialize(name)  
&emsp;&emsp;@name = name  
&emsp;end  

&emsp;def speak  
&emsp;&emsp;"Arf!"  
&emsp;end  
end  

sparky = GoodDog.new("Sparky")  
sparky.speak  

When you run this program, nothing happens. This is because the speak method returned the string "Arf!", but we now **need to print it out.** So we should add puts in front of it, like this:

puts sparky.speak           # => Arf!  
Now, we should see that the output of our program is the string "Arf!". We told sparky to speak and he did. 

Now, suppose we have another GoodDog object:

fido = GoodDog.new("Fido")  
puts fido.speak             # => Arf!  

Our second fido object can also perform **GoodDog behaviors**. Again, all objects of the same class have the same behaviors, though they contain different states; here, **the differing state is the name**.

What if we wanted to not just say "Arf!", but say "Sparky says arf!"? 
In our **instance methods**, which is what all the methods are so far, we have access to **instance variables**. 
- Use string interpolation and change our speak method to this (other code omitted):

## good_dog.rb
def speak  
&emsp;`"#{@name} says arf!"`  
end  

And now, we can expose information about the state of the object using instance methods.

puts sparky.speak           # => "Sparky says arf!"  
puts fido.speak             # => "Fido says arf!"  

# Accessor Methods
What if we wanted to print out only sparky's name? We could try the code below (other code omitted):

puts sparky.name  

Results in:  
`NoMethodError: undefined method `name' for` #<GoodDog:0x007f91821239d0 @name="Sparky">

A **NoMethodError** means that we **called a method** that doesn't exist or is unavailable to the object. 
- If we want to **access the object's name**, which is stored in the `@name` instance variable, we have to create a **method that will return the name**. 
- Say we call it `get_name`, and its only job is to **return** the value in the **@name instance variable**.

## good_dog.rb
class GoodDog  
&emsp;def initialize(name)  
&emsp;&emsp;@name = name  
&emsp;end  

&emsp;def `get_name`  
&emsp;&emsp;@name  
&emsp;end  

&emsp;def speak  
&emsp;&emsp;"#{@name} says arf!"  
&emsp;end  
end  

sparky = GoodDog.new("Sparky")  
puts sparky.speak  
puts sparky.`get_name`  

Ok, we've added our get_name method and it should return the value of our @name instance variable. Let's run this code and see if it works.

This is what we got back.

Sparky says arf!  
Sparky  
It worked! We now have a **getter method**. But what if we wanted to **change sparky's name?** That's when we reach for a **setter method**. It looks a lot like a getter method but with one small difference. Let's add it.

## good_dog.rb
class GoodDog  
&emsp;def initialize(name)  
&emsp;&emsp;@name = name  
&emsp;end  

&emsp;def get_name  
&emsp;&emsp;@name  
&emsp;end  

&emsp;def `set_name=(name)`  
&emsp;&emsp;@name = name  
&emsp;end  

&emsp;def speak  
&emsp;&emsp;"#{@name} says arf!"  
&emsp;end  
end  

sparky = GoodDog.new("Sparky")  
puts sparky.speak  
puts sparky.get_name  
sparky.`set_name = "Spartacus"`  
puts sparky.get_name  

The output of this code is:

Sparky says arf!  
Sparky  
`Spartacus`

As you can see, we've successfully changed sparky's name to the string "Spartacus".
- The first thing you should notice about the setter method `set_name=` is that Ruby gives us a **special syntax** to use it. 
- To use the **set_name= method normally**, we would expect to do this: **sparky.set_name=("Spartacus")**, where the entire **"set_name=**" is the **method name**, and the string "**Spartacus**" is the **argument** being passed in to the method. 
- Ruby recognizes that this is a **setter method** and allows us to use the more natural assignment syntax: `sparky.set_name = "Spartacus"`. 
When you see this code, just realize there's a method called `set_name=` working behind the scenes, and we're just seeing some **Ruby syntactical sugar**.

Finally, as a **convention**, Rubyists typically want to name those getter and setter methods using the **same name as the instance variable** they are exposing and setting. We'll make the change to our code as well:

## good_dog.rb
class GoodDog  
&emsp;def initialize(name)  
&emsp;&emsp;@name = name  
&emsp;end  

&emsp;def `name`                  # This was renamed from "get_name"  
&emsp;&emsp;@name  
&emsp;end  

&emsp;def `name=(n)`              # This was renamed from "set_name="  
&emsp;&emsp;@name = n  
&emsp;end  

&emsp;def speak  
&emsp;&emsp;"#{@name} says arf!"  
&emsp;end  
end  

sparky = GoodDog.new("Sparky")  
puts sparky.speak  
puts `sparky.name`            # => "Sparky"  
sparky.`name = "Spartacus"`  
puts sparky.name            # => "Spartacus"  

**Setter** methods always **return the value that is passed** in as an argument, **regardless** of **what happens inside** the **method**. 
- If the setter tries to return something other than the argument's value, it just **ignores** that attempt.

class Dog  
&emsp;def name=(n)  
&emsp;&emsp;@name = n  
&emsp;&emsp;`"Laddieboy"              # value will be ignored`  
&emsp;end  
end

sparky = Dog.new()  
puts(sparky.name = "Sparky")  # returns "Sparky"  

You'll notice that writing those **getter and setter methods took up a lot of room** in our program for such a simple feature.
- Ruby has a **built-in way** to automatically create these getter and setter methods for us, using the attr_accessor method. Check out this refactoring of the code from above.

## good_dog.rb
class GoodDog  
&emsp;`attr_accessor :name`  

&emsp;def initialize(name)  
&emsp;&emsp;@name = name  
&emsp;end  

&emsp;def speak  
&emsp;&emsp;"#{@name} says arf!"  
&emsp;end  
end

sparky = GoodDog.new("Sparky")  
puts sparky.speak  
puts sparky`.name`            # => "Sparky"  
sparky`.name = "Spartacus"`  
puts sparky.name            # => "Spartacus"  

Our output is the same! The `attr_accessor` method takes a **symbol** as an **argument**, which it uses to create the method name for the **getter and setter methods**. That one line replaced two method definitions.

But what if we **only** **want** the **getter** method **without the setter method**? Then we would want to use the `attr_reader` method. It works the same way but only allows you to retrieve the instance variable. 

And if you **only want** the **setter** method, you can use the `attr_writer` method. All of the attr_* methods take **Symbol objects** as arguments; if there are **more states** you're **tracking**, you can use this syntax:

`attr_accessor :name, :height, :weight`

## Accessor Methods in Action
With **getter and setter** methods, we have a way to **expose and change an object's state**. We can also use these methods from within the class as well. In the previous section, the speak method referenced the @name instance variable, like below:

def speak  
&emsp;"#{`@name`} says arf!"  
end  

Instead of referencing the instance variable directly, we want to use the name getter method that we created earlier, and that is given to us now by `attr_accessor`. We'll change the speak method to this:

def speak  
&emsp;"#{`name`} says arf!"  
end  
Can you spot the change? By **removing the @ symbol**, we're now calling the **instance method**, rather than the instance variable.

Why do this? Why not just reference the @name instance variable, like we did before? Technically, you could just reference the instance variable, but it's **generally a good idea** to call the **getter method** instead.

Suppose we're keeping track of social security numbers in an instance variable called @ssn. And suppose that we don't want to expose the raw data, i.e. the entire social security number, in our application. Whenever we retrieve it, we want to **only display the last 4 digits and mask the rest**, like this: "xxx-xx-1234". If we were **referencing the @ssn instance variable** directly, we'd need to sprinkle our entire class with code like this:

\# converts '123-45-6789' to 'xxx-xx-6789'  
'xxx-xx-' + @ssn.split('-').last  

And what if we find a **bug in this code**, or if someone says we **need to change the format** to something else?
- Much easier to just reference a getter method, and make the change in one place.

def ssn  
&emsp;# converts '123-45-6789' to 'xxx-xx-6789'  
&emsp;'xxx-xx-' + @ssn.split('-').last  
end  

Now we can use the ssn instance method (note without the @) throughout our class to retrieve the social security number. Following this practice will save you some headache down the line. Just like the getter method, we also want to do the same with the setter method. 
- Wherever we're changing the **instance variable directly** in our class, we should instead use the **setter method**. But there's a **gotcha**, which we'll cover next.


Suppose we added two more states to track to the GoodDog class called **"height"** and **"weight"**:

`attr_accessor :name, :height, :weight`

- This one line of code gives us **six getter/setter instance methods: name, name=, height, height=, weight, weight=**. 
- It also gives us **three instance variables**: **@name, @height, @weight**. 

Now suppose we want to create a new **method** that allows us to change **several states at once**, called `change_info(n, h, w)`.

 We could implement it like this:

def change_info(n, h, w)  
&emsp;@name = n  
&emsp;@height = h  
&emsp;@weight = w  
end  

Just to get caught up with all of our code, our **entire GoodDog class** now looks like the code below. 
- Note the change to the **initialize** method and also the new method `change_info`. 

Finally, we created another method called **info** that displays **all the states of the object**, just for convenience:

## good_dog.rb  
class GoodDog  
&emsp;attr_accessor :name, :height, :weight  

&emsp;def `initialize(n, h, w)`  
&emsp;&emsp;@name = n  
&emsp;&emsp;@height = h  
&emsp;&emsp;@weight = w  
&emsp;end  
  
&emsp;def speak  
&emsp;&emsp;"#{name} says arf!"  
&emsp;end  
  
&emsp;def `change_info(n, h, w)`  
&emsp;&emsp;@name = n  
&emsp;&emsp;@height = h  
&emsp;&emsp;@weight = w  
&emsp;end  
  
&emsp;def info  
&emsp;&emsp;"#{name} weighs #{weight} and is #{height} tall."  
&emsp;end  
end  

And we can use the `change_info` method like this:  

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')  
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.  

sparky.`change_info('Spartacus', '24 inches', '45 lbs')`  
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.  

Just like when we **replaced** **accessing** the **instance variable directly with getter methods**, we'd also like to do the **same with our setter methods**. Let's change the implementation of the change_info method to this:

def `change_info(n, h, w)`  
&emsp;name = n  
&emsp;height = h  
&emsp;weight = w  
end  

To save space, we won't repeat the code from above, but we can see that the **change_info** method **didn't change sparky's information**:

sparky.`change_info('Spartacus', '24 inches', '45 lbs')`  
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.  

What happened? Why didn't our setter methods work in the change_info method?

## Calling Methods With self
The reason our setter methods didn't work is because **Ruby thought** we were **initializing local variables**. 
- Recall: to **initialize or create new local variables** &rarr; x = 1 or str = "hello world".
- Instead of calling the **name=, height= and weight= setter methods,** we ended up **creating three new local variables** called name, height and weight. 

**To disambiguate** from creating a local variable, we need to use `self.name=` to let Ruby know that we're **calling a method**. So our change_info code should be updated to this:

def `change_info(n, h, w)`  
&emsp;`self.name` = n  
&emsp;`self.height` = h  
&emsp;`self.weight` = w  
end  

This **tells Ruby** that we're calling a **setter method**, not creating a local variable. To be consistent, we **could also adopt this syntax** for the getter methods as well, though it is **not required.**

def info  
&emsp;`"#{self.name} weighs #{self.weight} and is #{self.height} tall."`  
end  


Finally, if we run our code with the updated change_info method that uses the self. syntax, our code works beautifully:

sparky.`change_info('Spartacus', '24 inches', '45 lbs')`  
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.  

Note that prefixing `self.` is not restricted to just the accessor methods; you **can use it with any instance method**.
- For example, the **info method** is not a method given to us by attr_accessor, but we can still call it using **self.info:**

class GoodDog  
&emsp;# ... rest of code omitted for brevity  
&emsp;def some_method  
&emsp;&emsp;`self.info`  
&emsp;end  
end  

While this works, the general rule from the Ruby style guide is to 
- `"Avoid self where not required."`

# Exercises 
- See `..\scripts\02-object-oriented-ruby\classes_and_objects.rb` 

<h1 align="center">  Classes and Objects II </h1>

# Class Methods
All the methods we've created have been instance methods: methods that pertain to an **instance or object** of the class. 

**Level methods**, also called **class methods**, are methods we can call **directly on the class** itself, **without having to instantiate** any objects. 

When defining a **class method**, we **prepend** the method name with the reserved word `self.`, 
like this:

\# ... rest of code ommitted for brevity

def `self.what_am_i`         # Class method definition  
&emsp;"I'm a GoodDog class!  
end  

When calling the class method what_am_i:  
`GoodDog.what_am_i`          # => I'm a GoodDog class!

Class methods are where we put functionality that does not pertain to individual objects.
- Particularly, if a method does not need to deal with an object's states, a class method is more appropriate.

# Class Variables
As instance variables capture information specific to instances of a class, variables for an entire class are appropriately named **class variables**.
- Class variables are created using two @ symbols: `@@class_var_name`

Let's create a **class variable** and a **class method** to view that variable.

class GoodDog  
&emsp;`@@number_of_dogs = 0`  

&emsp;def initialize  
&emsp;&emsp;`@@number_of_dogs += 1`  
&emsp;end  

&emsp;def `self.total_number_of_dogs`  
&emsp;&emsp;`@@number_of_dogs`  
&emsp;end  
end  

puts GoodDog.total_number_of_dogs   # => 0  

dog1 = GoodDog.new  
dog2 = GoodDog.new  

puts GoodDog.total_number_of_dogs   # => 2  


The **class variable** `@@number_of_dogs` is initialized to 0.
- Our constructor (the initialize method called when an object is instantiated with the new keyword), increments that number by 1. 
- This also demonstrates that we can **access class variables** from **within** an **instance method** (initialize is an instance method). 
- Finally, we just return the value of the class variable in the class method `self.total_number_of_dogs`.

 This example uses a **class variable** and a **class method** to keep track of a **class level detail** that pertains only to the **class, and not to individual objects.**

# Constants 
Pretty simple: variables that you never want to change remain constant, and are named as such.
- Infitting with the naming conventions of a constant, a constant in Ruby is defined by using an **upper case letter** at the beginning of the variable name.
- Most Rubyists will tend to capitalize the entire word as is convention anyways.

class GoodDog  
&emsp;`DOG_YEARS = 7`  
  
&emsp;attr_accessor :name, :age  
  
&emsp;def initialize(n, a)  
&emsp;&emsp;self.name = n  
&emsp;&emsp;self.age  = a * `DOG_YEARS`  
&emsp;end  
end  
  
sparky = GoodDog.new("Sparky", 4)  
puts sparky.age             # => 28  

Here we used the constant `DOG_YEARS` to calculate the age in dog years when we created the object, sparky. 
- Note that we used the setter methods in the initialize method to initialize the **@name and @age instance variables** given to us by the **attr_accessor** method.
- We then used the age getter method to retrieve the value from the object.  


`DOG_YEARS` is a variable that will **never change for any reason** so we use a constant. 
- It is **possible to reassign a new value** to constants but **Ruby will throw a warning**.
# The to_s Method
The `to_s` instance method comes built into every class in Ruby. 

puts sparky      # => #\<GoodDog:0x007fe542323320>

What's happening here is that the puts method **automatically** calls `to_s` on its argument, which in this case is the **sparky object**. 
- puts sparky is equivalent to `puts sparky.to_s`. 
- By default, the to_s method returns the **name of the object's class** and an **encoding** of the **object id**.

Note: puts method calls `to_s` for any argument that is **not an array**.
- For an array, it writes on **separate lines** the result of calling `to_s` on **each element** of the array.

To test this, we can add a **custom** `to_s` method to our GoodDog class, **overriding** the default **to_s** that comes with Ruby.

class GoodDog  
&emsp;DOG_YEARS = 7  
&emsp;
&emsp;attr_accessor :name, :age  
&emsp;
&emsp;def initialize(n, a)  
&emsp;&emsp;@name = n  
&emsp;&emsp;@age  = a * DOG_YEARS  
&emsp;end  
&emsp;
&emsp;def `to_s`  
&emsp;&emsp;"This dog's name is #{name} and it is #{age} in dog years."  
&emsp;end  
end  

puts sparky      # => This dog's name is Sparky and is 28 in dog years.

There's another method called `p` that's very similar to puts, except it **doesn't call to_s** on its argument; it calls another built-in Ruby instance method called `inspect`. 
- The `inspect` method is very helpful for debugging purposes, so we don't want to override it.

p sparky         \# => #<GoodDog:0x007fe54229b358 @name="Sparky", @age=28>

This output implies that `p sparky` is equivalent to `puts sparky.inspect`.

`to_s` method is automatically on the `arr` array object, as well as the `x` integer object.

Besides being called automatically when using `puts`, another important attribute of the to_s method is that it's also **automatically** called in **string interpolation**. We've seen this before when using integers or arrays in string interpolation:

irb :001 > arr = [1, 2, 3]  
=> [1, 2, 3]  
irb :002 > x = 5  
=> 5  
irb :003 > "The `#{arr}` array doesn't include `#{x}`."  
=> The [1, 2, 3] array doesn't include 5.  

Here, the `to_s` method is **automatically** called on the arr array object, as well as the x integer object. We'll see if we can include our sparky object in a string interpolation:

irb :001 > "`#{sparky}`"  
=> "This dog's name is Sparky and it is 28 in dog years."  

In summary, the `to_s` method is called **automatically** on the object when we use it with **puts** or when used with **string interpolation**. This fact may seem trivial at the moment, but knowing when `to_s` is called will help us understand how to read and write better OO code.

## Overriding #to_s
As shown above, you can **customize** the behavior of `#to_s` in a class. If you don't customize `#to_s`, Ruby looks up the **inheritance chain** for another version of `#to_s`, which is usually `Object#to_s`.

When **overriding** (customizing) #to_s for use in a custom class, you must remember that Ruby expects **#to_s to always return a string**. 
- If it does not return a string, **#to_s won't work** as expected in places where #to_s is **implicitly invoked** like **puts and interpolation**. 
  - Instead of printing (or inserting) the value returned by #to_s, Ruby will **ignore the non-string value** and look in the inheritance chain for another version of **#to_s** that does **return a string**. 
  - In most cases, it will use the value returned by **Object#to_s** instead. 
  
  For instance:

class Foo  
&emsp;def to_s  
&emsp;&emsp;42  
&emsp;end  
end  
&emsp;
foo = Foo.new  
puts foo             # Prints #<Foo:0x0000000100760ec0>  
puts "foo is #{foo}" # Prints: foo is #<Foo:0x0000000100760ec0>  

If you change 42 to a string, then the code will work as intended:  

class Foo  
&emsp;def `to_s`  
&emsp;&emsp;`"42"`  
&emsp;end  
end  
&emsp;
foo = Foo.new  
puts foo             # Prints 42  
puts "foo is #{foo}" # Prints: foo is 42  

It's also worth noting that **overridding #to_s** only works for **objects** of the **type** where the customized **#to_s method is defined**. 
- In particular, if you have a **Bar** object named **bar** that has an **attribute** named **xyz** and a **Bar#to_s** method, then puts bar.xyz will not use the customized #to_s. The value returned by xyz is not a Bar object, so Bar#to_s does not apply it:

class Bar  
&emsp;attr_reader :xyz  
&emsp;def initialize  
&emsp;&emsp;@xyz = { a: 1, b: 2 }  
&emsp;end  
&emsp;
&emsp;def to_s  
&emsp;&emsp;'I am a Bar object!'  
&emsp;end  
end  
&emsp;
bar = Bar.new  
puts bar       # Prints I am a Bar object!  
puts bar.xyz   # Prints {:a=>1, :b=>2}  

# More about `self`
`self` can refer to different things depending on where it is used.

For example, so far we've seen two clear use cases for self:

Use `self` when calling **setter methods** from **within the class**. 
- In our earlier example we showed that `self` was necessary in order for our change_info method to work properly. 
- We had to use `self` to allow Ruby to **disambiguate** between initializing a local variable and calling a setter method.

Use self for **class method** definitions.

Let's play around with self to see why the above two rules work. Let's assume the following code:

class GoodDog  
&emsp;attr_accessor :name, :height, :weight  

&emsp;def initialize(n, h, w)  
&emsp;&emsp;self.name   = n  \# This is calling the setter for namne provided by `attr_accessor`  
&emsp;&emsp;self.height = h  
&emsp;&emsp;self.weight = w  
&emsp;end  

&emsp;def change_info(n, h, w)  
&emsp;&emsp;self.name   = n  
&emsp;&emsp;self.height = h  
&emsp;&emsp;self.weight = w  
&emsp;end  

&emsp;def info  
&emsp;&emsp;"#{self.name} weighs #{self.weight} and is #{self.height} tall."  
&emsp;end  
end  

This is our standard GoodDog class, and we're using `self` whenever we call an **instance method** from within the class. We know the rule to use self, but what does self really represent here? Let's add one more instance method to help us find out.  

class GoodDog  
&emsp;\# ... rest of code omitted for brevity  

&emsp;def what_is_self  
&emsp;&emsp;self  
&emsp;end  
end  
Now we can instantiate a new GoodDog object.  

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')  
p sparky.what_is_self  
\# => #<GoodDog:0x007f83ac062b38 @name="Sparky", @height="12 inches", @weight="10 lbs">  

That's interesting. From **within the class**, when an **instance method** uses `self`, it **references** the **calling object**. 
- In this case, that's the sparky object. Therefore, from within the change_info method, calling **self.name=** acts the **same** as calling **sparky.name=** from **outside the class** (you can't call sparky.name= inside the class, though, since it isn't in scope). 
- Now we understand why using self to call instance methods from within the class works the way it does!  

The other place we use self is when we're defining **class methods**, like this:  

class MyAwesomeClass  
&emsp;def `self.this_is_a_class_method`  
&emsp;end  
end  

When `self` is **prepended to a method definition**, it is defining a **class method**. We talked about these earlier. 
- In our GoodDog class method example, we defined a class method called self.total_number_of_dogs. This method returned the value of the class variable @@number_of_dogs. How is this possible? Let's add a line to our GoodDog class:  

class GoodDog  
&emsp;\# ... rest of code omitted for brevity  
&emsp;puts self  
end  

If you run the good_dog.rb file with the GoodDog class definition, you'll see that **GoodDog** is **output**. 
- Thus, you can see that using `self` **inside a class** but **outside an instance method** refers to the **class itself.** 
- Therefore, a **method** definition **prefixed with self** is the same as **defining the method on the class**. That is, def `self.a_method` is **equivalent** to def `GoodDog.a_method`. 
- That's why it's a class method; it's **actually being defined on the class**. 
- Using `self.a_method`, rather than ClassName.a_method is a **convention**. 
  - If in the future we **rename the class**, we only have to change the **name of the class**, rather than having to rename all of the class methods too.  

To be clear, from within a class...  

1. `self`, **inside** of an **instance method**, references the **instance (object)** that **called the method** - the calling **object**. 
- Therefore, **self.weight=** is the same as **sparky.weight=**, in our example.  

1. `self`, **outside** of an **instance method**, references the **class** and can be used to define **class methods**. 
- Therefore if we were to define a name class method, def **self.name=(n)** is the same as def **GoodDog.name=(n)**.  

Thus, we can see that `self` is a way of being **explicit** about what our **program is referencing** and what our intentions are as far as behavior. 
`self` changes depending on the **scope** it is used in, so pay attention to see if you're **inside an instance method** or not.

# Summary 
In this chapter we covered...

- Initializing objects with the `new` method
- How `instance variables` keep track of an **object's state**
- Learning how `attr_*` methods generate **getters and setters**
- Using `instance methods` to perform operations on our objects
- Using `class methods` to perform operations at the **class level**
- Assigning `class variables` to relate specifically to our class
- Assigning `constants` that never change to perform operations in our classes
- How the `to_s` method is used and that we've been using it **implicitly** all along.
- How and when to use `self`

# Exercises 
- See `..\scripts\02-object-oriented-ruby\classes_and_objects.rb` 

<h1 align="center">  Inheritance </h1>

`Inheritance` is when a **(sub)class** inherits behaviors from a **(super)class**.
- Common, shared behaviors between classes &rarr; move it to **superclass**!

# Class Inheritance
Here, we're extracting the speak method from the **GoodDog** class to the `superclass` **Animal**, and we use **inheritance** to make that behavior available to **GoodDog** and **Cat** classes.

class `Animal`  
&emsp;def speak  
&emsp;&emsp;"Hello!"  
&emsp;end  
end  

class GoodDog `<` Animal  
end  

class Cat `<` Animal  
end  

sparky = GoodDog.new  
paws = Cat.new  
puts sparky.speak           # => Hello!  
puts paws.speak             # => Hello!  

We use the `< symbol` to signify that the **GoodDog** class is inheriting from the **Animal** class. 
- **All** of the **methods** in the **Animal** class are available to the **GoodDog** class for use. 
- The new class called **Cat** that inherits from **Animal** as well. We've eliminated the speak method from the GoodDog class in order to use the speak method from Animal.  
- When we run this code we see the correct output. Both classes are now using the superclass Animal's speak method.  

But what if we want to use the original speak method from the GoodDog class only. Let's add it back and see what happens.  

class Animal  
&emsp;def `speak`  
&emsp;&emsp;"Hello!"  
&emsp;end  
end  

class GoodDog `<` Animal  
&emsp;attr_accessor :name  

&emsp;def initialize(n)  
&emsp;&emsp;self.name = n  
&emsp;end  

&emsp;def `speak`  
&emsp;&emsp;"#{self.name} says arf!"  
&emsp;end  
end  

class Cat < Animal  
end  

sparky = GoodDog.new("Sparky")  
paws = Cat.new  

puts sparky.speak           # => **Sparky says arf!**  
puts paws.speak             # => Hello!  

In the **GoodDog** class, we're `overriding` the **speak** method in the Animal class because Ruby **checks the object's class first** for the method before it looks in the superclass. 
- That means when we wrote the code `sparky.speak`, it first looked at **sparky's class**, which is **GoodDog**. It found the speak method there and used it.
- When we wrote the code `paws.speak`, Ruby first looked at **paws's class**, which is **Cat**. It did not find a speak method there, so it continued to look in Cat's **superclass**, Animal. It found a speak method in Animal, and used it. 

`Inheritance` can be a great way to **remove duplication** in your code base. 
- "**DRY**": "Don't Repeat Yourself" &rarr; If you find yourself writing the same logic over and over again in your programs, there are ways to extract that logic to one place for reuse.

# super

Ruby provides us with the `super` keyword to call methods **earlier** in the **method lookup path**. 
- When you call `super` from **within a method**, it searches the **method lookup path** for a method with the **same name**, then invokes it. 

Let's see a quick example of how this works:


class Animal  
&emsp;def speak  
&emsp;&emsp;"Hello!"  
&emsp;end  
end  

class GoodDog `<` Animal  
&emsp;def speak  
&emsp;&emsp;`super` + " from GoodDog class"  
&emsp;end  
end  

sparky = GoodDog.new  
sparky.speak        # => "Hello! from GoodDog class"  

In the above example, 
- We've created a simple **Animal** class with a **speak** instance method. 
- We then created **GoodDog** which **subclasses Animal** also with a **speak** instance method to **override the inherited version**. 
- However, in the **subclass' speak** method we use `super` to invoke the **speak** method from the **superclass, Animal**, and then we extend the functionality by appending some text to the return value.  

Another more common way of using super is with `initialize`. Let's see an illustration of that:  


class Animal  
&emsp;attr_accessor :name  

&emsp;def `initialize`(name)  
&emsp;&emsp;@name = name  
&emsp;end  
end  

class GoodDog `<` Animal  
&emsp;def `initialize`(color)  
&emsp;&emsp;`super`  
&emsp;&emsp;@color = color  
&emsp;end  
end  

bruno = GoodDog.new("brown")        # => `#<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">`  

The interesting concept we want to explain is the use of `super` in the **GoodDog class**.
- In this example, we're using `super` with **no arguments**. However, the `initialize` method, where `super` is being used, takes an argument and adds a new twist to how super is invoked. 
- Here, in addition to the default behavior, `super` **automatically forwards the arguments** that were passed to the method from which `super` is called (initialize method in GoodDog class). 
- At this point, `super` will **pass** the **color** argument in the initialize defined in the subclass to that of the **Animal superclass** and **invoke** it. 
- That explains the presence of **@name="brown"** when the bruno instance is created. 
- Finally, the subclass' `initialize` continues to **set the @color** instance variable.  

When called with **specific arguments**, eg. super(a, b), the **specified arguments** will be sent up the **method lookup chain**. Let's see a quick example:  


class BadDog `<` Animal  
&emsp;def initialize(age, name)  
&emsp;&emsp;`super(name)`  
&emsp;&emsp;@age = age  
&emsp;end  
end  

BadDog.new(2, "bear")        # => `#<BadDog:0x007fb40b2beb68 @age=2, @name="bear">`  

This is similar to our previous example, with the difference being that `super` takes an argument, hence the **passed in argument is sent** to the superclass. 
- Consequently, in this example when a BadDog object is created, the passed in name argument ("bear") is passed to the superclass and **set to the @name** instance variable.  

There's one last twist. If you call `super()` exactly as shown -- `with parentheses` -- it calls the **method in the superclass with no arguments** at all. 
- If you have a **method** in your **superclass** that takes **no arguments**, this is the **safest** -- and **sometimes the only** -- way to call it:  


class Animal  
&emsp;def `initialize`  
&emsp;end  
end  

class Bear < Animal  
&emsp;def initialize(color)  
&emsp;&emsp;`super()`  
&emsp;&emsp;@color = color  
&emsp;end  
end  

bear = Bear.new("black")        # => `#<Bear:0x007fb40b1e6718 @color="black">`  
If you forget to use the parentheses here, Ruby will raise an `ArgumentError` exception since the **number of arguments is incorrect**.  

# Mixing in Modules

Another way to **DRY** up your code in Ruby is to use **modules**. 

**Extracting common methods to a superclass,** like we did in the previous section, is a great way to model concepts that are **naturally hierarchical**.
- We gave the example of animals. We have a generic superclass called Animal that can keep all basic behavior of all animals. We can then expand on the model a little and have, perhaps, a Mammal subclass of Animal. We can imagine the entire class hierarchy to look something like the figure below.


![alt text](../images/animal_hierarchy.jpg "Possible Class Hierarchy ")


The above diagram shows what pure **class based inheritance** looks like. 
- Remember the goal of this is to put the right behavior (i.e., methods) in the right class so we don't need to repeat code in multiple classes. 
- We can imagine that all Fish objects are related to animals that live in the water, so perhaps a `swim` method should be in the Fish class. 
- We can also imagine that all **Mammal** objects will have **warm blood**, so we can create a method called `warm_blooded?` in the **Mammal** class and have it return **true**. 
- Therefore, the Cat and Dog objects will have access to the `warm_blooded?` method which is automatically inherited from Mammal by the Cat and Dog classes, but they won't have access to the methods in the Fish class.

This type of hierarchical modeling works, to some extent, but **there are always exceptions**. For example, we put the swim method in the Fish class, but some mammals can swim as well. We don't want to move the swim method into Animal because not all animals swim, and we don't want to create another swim method in Dog because that violates the DRY principle. For concerns such as these, we'd like to **group them into a module** and then **mix in that module to the classes** that require those behaviors. Here's an example:

module `Swimmable`  
&emsp;def `swim`  
&emsp;&emsp;"I'm swimming!"  
&emsp;end  
end  

class Animal; end  

class Fish < Animal  
&emsp;`include Swimmable`         # mixing in Swimmable module  
end  

class Mammal < Animal  
end  

class Cat < Mammal  
end  

class Dog < Mammal  
&emsp;`include Swimmable`         # mixing in Swimmable module  
end  

And now **Fish and Dog objects can swim**, but objects of other classes won't be able to:  

sparky = Dog.new  
neemo  = Fish.new  
paws   = Cat.new  
**sparky.swim**                 # => I'm swimming!  
**neemo.swim**                  # => I'm swimming!  
paws.swim                   # => NoMethodError: undefined method `swim' for #\<Cat:0x007fc453152308>  

Using **modules to group common behaviors** allows us to build a more **powerful, flexible** and DRY design.  

Note: A common naming convention for Ruby is to use the `"able" suffix` on whatever verb describes the **behavior that the module is modeling**.
- You can see this convention with our `Swimmable` module. 
- Likewise, we could name a module that describes "walking" as `Walkable`. Not all modules are named in this manner, however, it is quite common.

# Inheritance vs Modules

Now you know the two primary ways that Ruby implements inheritance. 
- `Class inheritance` is the traditional way to think about inheritance: **one type inherits the behaviors of another type**. The result is a **new type** that **specializes** the type of the **superclass**.
- The other form is sometimes called `interface inheritance`: this is where **mixin modules** come into play. The **class doesn't inherit** from another type, but instead **inherits the interface** provided by the **mixin module**. In this case, the **result type is not a specialized** type with respect to the module.

You may wonder when to use **class inheritance vs mixins**. Here are a couple of things to consider when evaluating these choices.

You can only **subclass** (class inheritance) from `one` **class**. You can **mix in** as `many modules` (interface inheritance) as you'd like.

`Class Inheritance`: If an instance of **class B** can be described as **a kind of class A**, then we say that B and A have an **is-a** relationship. 
- If such a relationship exists, then we probably want to use **class inheritance** such that **class B inherits from class A**.

`Interface Inheritance`: If **class B and A** do **not** have an **is-a** relationship, there may be a **has-a relationship** involved. 
- We saw **has-a** relationships in conjunction with **composition and aggregation**, but such relationships also exist when **interface existence** is desired.
- If you can say that **class A** has the **behaviors of type B**, but **B and A don't have an is-a** relationship, then you probably want to **define B as a module** and use **interface inheritance**.

Note that you `cannot instantiate modules`. In other words, **objects cannot be created from modules.**
As you get better at OO design, you'll start to develop a feel for when to use class inheritance versus mixing in modules.
# Method Lookup Path

Now that you have a grasp on both **inheritance and mixins**, let's put them both together to see how that affects the `method lookup path`. 
- Recall the `method lookup path` is the **order** in which **classes are inspected** when you **call a method**. Let's take a look at the example code below.

module Walkable  
&emsp;def walk  
&emsp;&emsp;"I'm walking."  
&emsp;end  
end  

module Swimmable  
&emsp;def swim  
&emsp;  "I'm swimming."  
&emsp;end  
end  

module Climbable  
&emsp;def climb  
&emsp;  "I'm climbing."  
&emsp;end  
end  

class Animal  
&emsp;include Walkable  

&emsp;def speak  
&emsp;  "I'm an animal, and I speak!"  
&emsp;end  
end  

We have three modules and one class. We've mixed in one module into the Animal class. The method lookup path is the path Ruby takes to look for a method. We can see this path with the ancestors class method.  


puts "---Animal method lookup---"  
puts `Animal.ancestors`  
The output looks like this:  


---Animal method lookup---  
Animal  
Walkable  
Object  
Kernel  
BasicObject  

This means that when we call a **method of any Animal object**
- First Ruby looks in the **Animal class**
- then the **Walkable module**
- then the **Object class**
- then the **Kernel module**
- and finally the **BasicObject class**.  


fido = Animal.new  
fido.speak                  # => I'm an animal, and I speak!  
Ruby found the speak method in the **Animal class** and looked no further.  


fido.walk                   # => I'm walking.  
Ruby first **looked for the walk instance method in Animal**, and not finding it there, kept looking in the next place according to our list, which is the **Walkable module**. It saw a walk method there, executed it, and stopped looking further.  


fido.swim  
&emsp;# => NoMethodError: undefined method `swim' for #\<Animal:0x007f92832625b0>  
Ruby traversed all the classes and modules in the list, and didn't find a swim method, so it threw an error.  

Let's add another class to the code above. This class will inherit from the Animal class and mix in the Swimmable and Climbable modules.  


class GoodDog < Animal  
&emsp;include Swimmable  
&emsp;include Climbable  
end  

puts "---GoodDog method lookup---"  
puts `GoodDog.ancestors`  
And this is the output we get:  


---GoodDog method lookup---  
GoodDog  
Climbable  
Swimmable  
Animal  
Walkable  
Object  
Kernel  
BasicObject  

There are several interesting things about the above output. 
- First, this tells us that the **order in which we include modules is important**. Ruby actually looks at the `last module we included first`. 
- This means that in the rare occurrence that the modules we mix in contain a method with the same name, the **last module included will be consulted first**. 
- The second interesting thing is that the **module included in the superclass** made it on to the **method lookup path**. That means that all **GoodDog** objects will have access to **not** **only Animal methods**, but also methods defined in the **Walkable module**, as well as **all other modules mixed** in to any of its **superclasses**.

Sometimes when you're working on a large project, it can be confusing where all these methods are coming from. By understanding the method lookup path, we can have a better idea of where and how all available methods are organized.

# More Modules

We've already seen how modules can be used to mix-in common behavior into classes. Now we'll see two more uses for modules.  

The first use case we'll discuss is using **modules for** `namespacing`. 
- In this context, namespacing means **organizing similar classes** under a **module**. In other words, we'll use modules to **group related classes**. Therein lies the first advantage of using modules for namespacing. It becomes **easy** for us to **recognize related classes** in our code. The second advantage is it **reduces the likelihood** of our **classes colliding** with other **similarly named classes** in our codebase. Here's how we do it:  

  
`module Mammal`  

&emsp;class Dog  
&emsp;&emsp;def speak(sound)  
&emsp;&emsp;&emsp;p "#{sound}"  
&emsp;&emsp;end  
&emsp;end  

&emsp;class Cat  
&emsp;&emsp;def say_name(name)  
&emsp;&emsp;&emsp;p "#{name}"  
&emsp;&emsp;end  
&emsp;end  
end  

We call **classes in a module** by appending the class name to the module name with two colons(::)  

  
buddy = `Mammal::Dog.new`  
kitty = `Mammal::Cat.new`  

buddy.speak('Arf!')           # => "Arf!"  
kitty.say_name('kitty')       # => "kitty"  

The second use case for modules we'll look at is using **modules as a container for methods**, called `module methods`. This involves using modules to house other methods. This is very useful for methods that seem out of place within your code. Let's use a new module to demonstrate this:  

  
module `Conversions`  
&emsp;def `self.farenheit_to_celsius(num)`  
&emsp;&emsp;(num - 32) * 5 / 9  
&emsp;end  
end  

Defining methods this way within a module means we can **call them directly from the module**:  

  
value = `Conversions.farenheit_to_celsius(32)`  
We can also call such methods by doing:  

  
value = `Conversions::farenheit_to_celsius(32)`  
although the former (`Conversions.`) is the **preferred** way.  

# Private, Protected, and Public  

The last thing we want to cover is something that's actually quite simple, but necessary; `Method Access Control`.
- It is generally implemented through the use of **access modifiers**. The purpose of access modifiers is to **allow or restrict access** to a particular thing. 
- In Ruby, the things that we are concerned with **restricting access** to are the **methods defined in a class**. In a Ruby context, therefore, you'll commonly see this concept referred to as Method Access Control.  

The way that Method Access Control is implemented in Ruby is through the use of the `public`, `private`, and `protected` **access modifiers**. Right now, all the methods in our GoodDog class are public methods. 

A `public` **method** is a method that is **available to anyone** who knows either the **class name** or the **object's name**.
- These methods are **readily available** for the **rest of the program to use** and comprise the class's interface (that's how other classes and objects will interact with this class and its objects).  

Sometimes you'll have **methods** that are doing work **in the class** but **don't need** to be available to the **rest of the program**. These methods can be defined as `private`. How do we define private methods? 
- We use the private method call in our program and **anything below it is private** (unless another method, like protected, is called after it to negate it).  

In our GoodDog class we have one operation that takes place that we could move into a private method. When we initialize an object, we calculate the dog's age in Dog years. Let's refactor this logic into a method and make it private so nothing outside of the class can use it.  

  
class GoodDog  
&emsp;DOG_YEARS = 7  

&emsp;attr_accessor :name, :age  

&emsp;def initialize(n, a)  
&emsp;&emsp;self.name = n  
&emsp;&emsp;self.age = a  
&emsp;end  

&emsp;`private` \# anything below this is private unless a `protected` keyword is called  

&emsp;def human_years  
&emsp;&emsp;age * DOG_YEARS  
&emsp;end  
end  

sparky = GoodDog.new("Sparky", 4)  
sparky.`human_years`  
We get the error message:  

  
NoMethodError: `private method 'human_years'` called for
&emsp;#<GoodDog:0x007f8f431441f8 @name="Sparky", @age=4>
  
We have made the human_years method `private` by placing it under the private method. What is it good for, then, if we can't call it? **private methods** are only **accessible** from **other methods in the class**. For example, given the above code, the following would be allowed:  

  
\# assume the method definition below is above the "private" method  

def public_disclosure  
&emsp;"#{self.name} in human years is #{human_years}"  
end  

Note that in this case (and prior to `Ruby 2.7`), we **can not** use **self.human_years**, because the **human_years** method is `private`. Remember that **self.human_years** is equivalent to **sparky.human_years**, which is **not allowed for private methods**. Therefore, we have to just use human_years. 
- In summary, `private` methods are **not accessible** outside of the **class definition** at all, and are **only accessible** from **inside the class** when **called** **without self**.  

Again, as of `Ruby 2.7`, it is now **legal** to call **private methods** with a **literal self** as the **caller**. 
- Note that this does not mean that we can call a private method with any other object, not even one of the same type. We can only **call a private method** with the **current object**.  

`public` and `private` methods are most common, but in some less common situations, we'll want an **in-between approach**. For this, we can use the `protected` method to create protected methods. `protected` methods are similar to private methods in that they **cannot be invoked outside the class**. The main difference between them is that `protected` methods **allow access between class instances**, while private methods do not.  

Let's take a look at an example:  

  
class Person  
&emsp;def initialize(age)  
&emsp;&emsp;@age = age  
&emsp;end  

&emsp;def older?(other_person)  
&emsp;&emsp;age > `other_person.age`  \# this implies each **Person** can access another **Person**'s age getter method  
&emsp;end  

&emsp;protected  

&emsp;attr_reader :age  
end  

malory = Person.new(64)  
sterling = Person.new(42)  

malory.older?(sterling)  # => true  
sterling.older?(malory)  # => false  

malory.age  # getter from `attr_reader`  
&emsp;# => NoMethodError: protected method `age' called for #<Person: @age=64>  

The above code shows us that
- Like `private` methods, `protected` methods **cannot be invoked** from **outside of the class**. &rarr; malory.age **fails**
- However, **unlike** `private` methods, **other instances** of the **class (or subclass)** can also **invoke the method**. This allows for **controlled access**, but **wider access** between objects of the **same class type**.  

# Accidental Method Overriding  

It’s important to remember that **every class** you create **inherently subclasses** from class `Object`. The Object class is **built into Ruby** and comes with **many critical methods**.  

  
class Parent  
&emsp;def say_hi  
&emsp;&emsp;p "Hi from Parent."  
&emsp;end  
end  

Parent`.superclass`       # => Object  
This means that methods defined in the Object class are available in all classes.  

Further, recall that through the magic of inheritance, a subclass can **override a superclass’s method**.  

  
class Child < Parent  
&emsp;def say_hi  
&emsp;&emsp;p "Hi from Child."  
&emsp;end  
end  

child = Child.new  
child.say_hi         # => **"Hi from Child."**  

This means that, if you **accidentally override a method** that was originally defined in the **Object class**, it can have far-reaching effects on your code. 
- For example, `send` is an **instance method** that all classes inherit from **Object**. If you defined a new `send` instance method in your class, all objects of your class will call your custom `send` method, instead of the one in class Object, which is probably the one they mean to call. 
- **Object** `send` serves as a way to **call a method** by **passing** it a **symbol or a string** which represents the **method you want to call**. The next couple of arguments will represent the method's arguments, if any. Let's see how `send` normally works by making use of our Child class:  

  
son = Child.new  
son.`send` :say_hi       # => "Hi from Child."  
Let's see what happens when we define a `send` method in our Child class and then try to invoke Object's send method:  

  
class Child  
&emsp;def say_hi  
&emsp;&emsp;p "Hi from Child."  
&emsp;end  

&emsp;def `send`  
&emsp;&emsp;p "send from Child..."  
&emsp;end  
end  

lad = Child.new  
lad.send :say_hi  
Normally we would **expect** the output of this call to be "Hi from Child." but upon running the code we get a completely different result:  

  
`ArgumentError`: wrong number of arguments (1 for 0)  
from (pry):12:in `send'  

In our example, we're passing `send` **one argument** even though our overridden send method does **not take any arguments**. 

Let's take a look at another example by exploring **Object's** `instance_of?` method. 
- What this handy method does is to **return** `true` if an object is an **instance of a given class** and `false` **otherwise**. Let's see it in action:  

  
c = Child.new  
c.`instance_of?` Child      # => true  
c.`instance_of?` Parent     # => false  
Now let's override `instance_of?` within Child:  

  
class Child  
&emsp;\# other methods omitted  

&emsp;def instance_of?  
&emsp;&emsp;p "I am a fake instance"  
&emsp;end  
end  

heir = Child.new  
heir.instance_of? Child  

Again, we'll see something completely different though our intention was to use Object's instance_of? method:  

  
`ArgumentError`: wrong number of arguments (1 for 0)  
from (pry):22:in `instance_of?'  

That said, one Object instance method that's **easily overridden without any major side-effect** is the `to_s` method. You'll normally want to do this when you **want a different string representation of an object**. 

Overall, it’s important to **familiarize yourself** with some of the **common Object methods** and make sure to **not accidentally override** them as this can have devastating consequences for your application.  