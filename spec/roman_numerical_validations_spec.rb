require 'spec_helper'

describe RomanNumeral::Validator do
  it "should accept romal numeral" do
    RomanNumeral.new "MCMLIV"
  end

  it "should not accept non string" do
    expect { RomanNumeral.new 10 }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: should be string.")
    expect { RomanNumeral.new nil }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: should be string.")
    expect { RomanNumeral.new Object.new }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: should be string.")
  end

  it "should not accept blank string" do
    expect { RomanNumeral.new "" }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: should not be blank.")
  end

  it "should contain only roman symbols I V X L C D and M" do
    expect { RomanNumeral.new "ABC"   }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: should contain only roman symbols I V X L C D and M.")
    expect { RomanNumeral.new "123.1" }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: should contain only roman symbols I V X L C D and M.")
  end

  it "symbols I X C and M can be repeated three times in succession but no more" do
    expect { RomanNumeral.new "MCCCC"  }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: symbols I X C and M can be repeated three times in succession but no more.")
    expect { RomanNumeral.new "IIIII"  }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: symbols I X C and M can be repeated three times in succession but no more.")
    expect { RomanNumeral.new "MMMMMI" }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: symbols I X C and M can be repeated three times in succession but no more.")
    expect { RomanNumeral.new "XXXXI"  }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: symbols I X C and M can be repeated three times in succession but no more.")
    RomanNumeral.new "XXX"
    RomanNumeral.new "XXXLI"
    RomanNumeral.new "CCCDIII"
  end

  it "symbols D L and V can never be repeated in succession" do
    expect { RomanNumeral.new "DD"  }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: symbols D L and V can never be repeated in succession.")
    expect { RomanNumeral.new "LL"  }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: symbols D L and V can never be repeated in succession.")
    expect { RomanNumeral.new "VV"  }.to raise_error(ArgumentError, "Galaxy::RomanNumeral::Validator: symbols D L and V can never be repeated in succession.")
  end
end