require 'spec_helper'

describe RomanNumeral do
  it "should work for all valid roman numeral" do
    1.upto(3999) do |decimal|  
      roman_numeric = RomanNumeral.from_decimal(decimal)
      #puts " ...testing #{roman_numeric} => #{decimal}"
      RomanNumeral.new(roman_numeric).to_decimal.should == decimal
    end
  end

  it "should not handle incorrect roman numeral" do
    expect { RomanNumeral.new "XXXXXXXX"  }.to raise_error(ArgumentError)
    expect { RomanNumeral.new ""          }.to raise_error(ArgumentError)
    expect { RomanNumeral.new "IVIVIVIM"  }.to raise_error(ArgumentError)
    expect { RomanNumeral.new "102311"    }.to raise_error(ArgumentError)
    expect { RomanNumeral.new "."         }.to raise_error(ArgumentError)
    expect { RomanNumeral.new "i"         }.to raise_error(ArgumentError)
    expect { RomanNumeral.new "mmMMM"     }.to raise_error(ArgumentError)
  end
end