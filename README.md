Generators
==========

Use Thor to generate new projects.

Start and installation
----------------------

You need Ruby 1.9.3+ with Bundler. It's best to use RVM.

Install all needed gems:

    $ bundle

List available tasks:

    $ thor list

Create a Ruby gem, starting in this directory

    $ thor gen:ruby-gem /path/to/wherever

Make `gen:whatever` tasks available to Thor anywhere:

    $ thor :install


Skeletons
---------

Available skeletons are in the `skeletons` directory. Go through
available skeletons to see which options are possible.
