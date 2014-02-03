galaxy
======

[![Code Climate](https://codeclimate.com/github/amolpujari/galaxy.png)](https://codeclimate.com/github/amolpujari/galaxy)

[![Coverage Status](https://coveralls.io/repos/amolpujari/galaxy/badge.png?branch=master)](https://coveralls.io/r/amolpujari/galaxy)

tested with ruby 2

    # having rvm with ruby 2 installed
    git clone git@github.com:amolpujari/galaxy.git
    cd galaxy
    bundle
    rspec -f d

    # run examples
    ruby examples/do.rb examples/sample1.input 
    ruby examples/do.rb examples/sample2.input

# About

Galaxy mainly includes
  * Message:- to process intergalactic transactions messages
    * Message knows how to process various types of messages
    * It is contained of various message processors
    * One can add and/or modify message processors
  * Numeral:- defines galaxy numerals, converts galaxy numerals to decimals
  * Metal:- defines metals and dirt
  * RomanNumeral:- to represent roman numerals, conversion between roman and decimal numerals



