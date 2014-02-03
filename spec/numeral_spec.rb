require 'spec_helper'

describe Numeral do
  it "should convert galaxy numerals to decimal" do
    Numeral.add "x1", "I"
    Numeral.add "x5", "V"
    Numeral.add "x10", "X"
    Numeral.add "x50", "L"
    Numeral.add "x100", "C"
    Numeral.add "x500", "D"
    Numeral.add "x1000", "M"

    Numeral.new("x1000 x1").to_decimal.should == 1001
    Numeral.new("x1000 x100 x10 x1").to_decimal.should == 1111
    Numeral.new("x1000 x100 x500 x1 x10 x1 x1").to_decimal.should == 1411
  end

  it "should not accept blank" do
    expect { Numeral.new("")  }.to raise_error(ArgumentError, "Galaxy::Numeral: must not be blank.")
  end

  it "should not accept other than string" do
    expect { Numeral.new(nil)        }.to raise_error(ArgumentError, "Galaxy::Numeral: must be a string.")
    expect { Numeral.new(1)          }.to raise_error(ArgumentError, "Galaxy::Numeral: must be a string.")
    expect { Numeral.new(Object.new) }.to raise_error(ArgumentError, "Galaxy::Numeral: must be a string.")
  end

  it "should handle incorrect numerlas" do
    Numeral.add "x1", "I"
    Numeral.add "x5", "V"
    Numeral.add "x10", "X"
    Numeral.add "x50", "L"
    Numeral.add "x100", "C"
    Numeral.add "x500", "D"
    Numeral.add "x1000", "M"

    Numeral.new("x1 x1000 x1").to_decimal.should == nil
    Numeral.new("x1 x500 x1000 x100 x1000 x1 x1 x1 x1").to_decimal.should == nil
  end
end