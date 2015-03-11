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
```

Development
-----------

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
