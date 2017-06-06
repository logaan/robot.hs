# robot

This application is a simulation of a toy robot moving on a square tabletop, of
dimensions 5 units x 5 units.

## Dependencies

Stack is required. The application was developed with version 1.4.0.

## Running

    ./scripts/exec examples/a

Will compile the project and run the command file a. Output will be printed.
After the first execution the only output you should see will be from the robot
executable its self.

## Test suite

    ./scripts/test

Will run the test suite. "All tests passed." will be printed if successful. No
unit testing tool is used as I'm unfamiliar with the ecosystem.

Additional testing could be done with QuickCheck, perhaps testing that
no series of commands can cause a robot to move off the table. I believe many
other erroneous states should be unrepresentable with the data types chosen.

I'm not sure what norms regarding test granularity are in Haskell. I've written
less tests than I would for a dynamically typed language as I'm more confident
errors will be reported by the type checker. Also that these errors when found
will point to the root of the issue and so granular tests are less helpful.

## Checking with new commands

If would would like to run the application against additional sets of commands
in order to see its output I would recommend creating a new command file and
calling `./scripts/exec path/to/new/file`. The command file should be in the
same format as those files in the `examples` directory. Please not that a
trailing newline is required.
