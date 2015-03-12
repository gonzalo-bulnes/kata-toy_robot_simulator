Toy Robot Simulator Kata
========================

A _kata_ which goal is simulating [a toy robot roaming around a table][problem].

  [problem]: PROBLEM.md

Usage
-----

```bash
# If necessary allow the simulator to be executed
#chmod u+x ./bin/toy_robot_simulator

# Run the simulation
./bin/toy_robot_simulator

# Then type commands to simulate the robot motion,
# and type Ctrl+D to exit.
```

### Commands

#### Conventions

The robot situation is represented by the vector `(x,y,ORIENTATION)`, where `x` and `y` are integers and `ORIENTATION` is `SOUTH`, `EAST`, `NORTH` or `WEST`. Conventionally, `x` does increase toward `EAST` and decrease toward `WEST`, while `y` does increase toward `NORTH` and decrease toward `SOUTH`.

#### Index

- `REPORT` does print the current robot situation
- `PLACE x,y,ORIENTATION` does place the robot in the specified position with the proper orientation as long as that position is not off the table
- `MOVE` does move the robot one unit in the direction it is facing if it won't make it fall off the table
- `LEFT` and `RIGHT` do rotate it to its left, respectively right.

**Note**: the robot cannot roam around if it is off the table! Don't forget to `PLACE` it on the table before issuing other commands.

Development
-----------

### Verbosity settings

The Toy Robot Simulator is verbose by default, because it is intended to be used interactively, i.e. by people. If a bare-minimum output was desired, the simulator can be made quiet by setting the `verbose = false` in [this file][bin].

  [bin]: bin/toy_robot_simulator

### Testing and documentation

[RSpec tags][tags] are used to categorize the spec examples.

Spec examples that are tagged as `public` describe aspects of the public API, and MAY be considered as the documentation.

The `private` or `protected` specs are written for development purpose only. Because they describe internal behaviour which may change at any moment without notice, they are only executed as a secondary task by default (`rake`) and SHOULD be ignored.

Run `rake spec:public` to print the public documentation.

  [tags]: https://www.relishapp.com/rspec/rspec-core/v/3-2/docs/command-line/tag-option

License
-------

    Toy Robot Simulator - Let's not let the robot fall off the table!
    Copyright (C) 2015 Gonzalo Bulnes Guilpain

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
