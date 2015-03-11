ROADMAP
=======

Random thougths
---------------

The robot falling or not only depends on the situation of its _location_ relatively to the table characteristics. The table could be defined as a collection of locations, being a square it could be defines via (*max_x*, *max_y*) or better (*min_x*, *max_x*, *min_y*, *max_y*), or defining boundaries (e.g. `x <= 5`, 'x >= 0' and so on).

The commands should not be applied immediately, because the should be checked for safety first (maybe bang (`!`), non-bang methods could be written). Safety means: the next location is not off the table. Or: the next location is not off the table boundaries. By the way, the `RIGHT`, `LEFT`, and `RECORD` commands are safe.

There are two kind of state involved: the robot is on the table or not (see the *do_nothing_before_a_PLACE_command* constraint), and it has a given orientation (the `LEFT` resulting orientation depends on the previous one).

A safe space can also be defined, which depends on the robot speed. In this case, in the `((1,1), (4,4))` inner square every command is safe. If the table was large, that last may be interesting.


Objects
-------

The simulator involves a **robot**, and a **table**. It also receives user input and outputs as well. I've seen something similar done in a _kata_ from [The RSpec Book][rspec-book], which involved an additional object called **game** to handle interaction with the user - player. Let's call our wrapper **simulation**.


Iterations
----------

1. Let's accept user input so they can play inputing commands even if those do nothing (file or interactive prompt).
1. Allow input from a file (or allow interactive input if file input implementation was easier)
1. Log received commands (for debug, or user feedback)
1. Move the robot:
  - REPORT (makes debgging easier)
  - PLACE
  - MOVE
  - LEFT, RIGHT
  - Note: if the robot location were to be defined as `(x, y, F)` that is _position_ and _orientation_, the MOVE, LEFT and RIGHT commands would be very similar.
1. Add initial placement condition (ignore input until the robot is PLACEd - **beware of possible invalid PLACE commands!**)
1. Add table boundaries constraints (I like the idea of defining the table through its boundaries, it's quite extensible)
1. Add some color to output? (Could that produce noise in any terminals?)