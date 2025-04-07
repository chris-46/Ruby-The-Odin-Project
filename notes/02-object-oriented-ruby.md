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
- See `..\scripts\02-object-oriented-ruby\classes_and_objects_I.rb` 

<h1 align="center">  Classes and Objects II </h1>

# Class Methods
# Class Variables
# Constants 
# The to_s Methods
# More about self
# Summary 
# Exercises 
- See `..\scripts\02-object-oriented-ruby\classes_and_objects_II.rb` 

<h1 align="center">  Inheritance </h1>

# Class Inheritance
# super
# Mixing in Modules
# Inheritance vs Modules
# Method Lookup Path
# More Modules
# Private, Protected, and Public
# Accidental Method Overriding
# Summary