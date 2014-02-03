require "galaxy/roman_numeral/validator"
require "galaxy/roman_numeral/decimalizer"
require "galaxy/roman_numeral/roman_numeralizer"

module Galaxy
  class RomanNumeral
    #http://en.wikipedia.org/wiki/Roman_numerals

    Symbols = {
      "I" => 1,
      "V" => 5,
      "X" => 10,
      "L" => 50,
      "C" => 100,
      "D" => 500,
      "M" => 1000
    }

    def initialize numeral
      Validator.validate numeral
      @numeral = numeral
      @decimal = Decimalizer.decimalize numeral
    end

    def to_s
      @numeral
    end

    def to_decimal
      @decimal
    end

    def self.from_decimal decimal
      @decimal = decimal
      @numeral = RomanNumeralizer.numeralize decimal
    end
  end
end
