# How This Course Will Work - Notes
Ruby can allow you to write a task that might take dozens of lines in Java or a hundred lines in C in just a few lines &rarr; many use functions are prepackaged into easy-to-use and convenient methods!

## By end of course, you should be able to:
- Save & open files
- Write tests for your code
- Separate spaghetti code into **classes**
- Reproduce basic algorithms & data structures to fix problems

## The Path Ahead
- In the first section, you’ll learn all about the **basics of Ruby** along with some classic programming basics.
- In the second section, you’ll learn about **object-oriented programming**, which will show you how to cleanly and neatly organize your code into reusable objects.
- In the third section, you’ll dive into some basic computer science, where you’ll learn about **recursion** and **common data structures**.
- In the fourth section, you’ll learn some more **advanced features of Git** and the **Git workflow** used by professional developers.
- In the fifth section, you’ll learn the basics of **test-driven development**.
- In the sixth and final section, you’ll tie everything together by building a fully fledged **chess game**.

## [About Ruby]("https://en.wikipedia.org/wiki/Ruby_(programming_language)")
- Yukihiro "Matz" Matusumoto in 1993 ➡️ Easy-to-use, Object-oriented, minimal syntax.
    - Everything is an **object**
- Ruby is **interpreted**, **dynamically typed**, uses **garbage collection**, and **just-in-time compilation**.

## Syntax
- The syntax of Ruby is broadly similar to that of Perl and Python. 
- **Class and method definitions** are signaled by **keywords**, whereas **code blocks** can be defined by either **keywords or braces**. 
- For practical purposes there is **no distinction** between **expressions and statements**.
- **Line breaks** are significant and taken as the **end of a statement**; a **semicolon** may be **equivalently used**. 
- Unlike Python, **indentation is not significant**.
- Ruby keeps all of its **instance variables** completely **private to the class** and only **exposes** them through **accessor methods** (attr_writer, attr_reader, etc.). 
    - Unlike the "getter" and "setter" methods of other languages like C++ or Java, **accessor methods** in Ruby can be created with a **single line of code** via **metaprogramming**;(optionally can also be created in the traditional fashion of C++ and Java).
    - These methods **do not require** **parentheses** to invoke, so it is trivial to change an **instance variable** into a **full function** &rarr; no need to modify calling code or refactoring.

### Python vs. Ruby: Property Descriptors
Python's property descriptors are similar, but come with a trade-off in the development process. If one begins in **Python** by using a **publicly exposed instance variable**, and later changes the implementation to use a **private instance variable** exposed through a **property descriptor**, code internal to the class may need to be adjusted to use the private variable rather than the public property. 

Ruby's design **forces all instance variables to be private**, but also provides a simple way to declare set and get methods. 
- In Ruby, one **never directly accesses** the internal members of a class from outside the class; rather, one passes a message to the class and receives a response.