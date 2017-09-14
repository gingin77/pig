---
course: >-
  Ruby on Rails
title: >-
  Pig Players
description: >-
  Use object-oriented programming and inheritance to make a better player for the game of Pig.
---

[The game of Pig](https://en.wikipedia.org/wiki/Pig_(dice_game)) is commonly implemented in exercises to learn programming and better understand probability. In this project, you will implement different players for the game in order to better understand inheritance.

This project contains starter files in the `starter_files/` directory. In `lib/`, you will find `pig.rb`, containing a `Pig` class to run the game, and `player.rb`, which implements a `Player` class and one subclass, `CautiousPlayer`. In `player.rb`, you will implement multiple subclasses of `Player`, each using a different strategy to play the game. There is not a specified set of strategies you must implement, but you must implement at least three. Some ideas are:

* a player that stops 50% of the time
* a player that stops when they get a particular score for a turn
* a player that stops after a certain number of rolls
* a player that changes strategies based on their current total score

You will have to read the code for the `Player` class to see what you will need to override and extend. You may be tempted to make a player that cheats, but there is a test suite that will test all subclasses of `Player` to make sure they record scores correctly.

[callout-info]
Usually in Ruby, you would put each subclass in a separate file. In this case, you _must_ put them in `lib/player.rb` for the program to find them.
[/callout-info]

To see how successful your player classes are, run `./bin/pig` from the `starter_files/` directory. By default, this will run two `CautiousPlayer`s against each other. You can specify the names of the `Player` subclasses you have written in order to run those subclasses against each other or against `CautiousPlayer`.

[callout-cool]
The game runner and test suite for this project use some advanced features of Ruby and demonstrate _metaprogramming_ -- that is, code that writes other code. Try reading `bin/pig` and `test/player_test.rb` and figure out how they work.
[/callout-cool]

[callout-download]
[/callout-download]
# pig
