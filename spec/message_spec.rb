require 'spec_helper'

describe "Intergalactic Transaction" do
  it "should process transaction" do
    intergalactic_transaction(%{
        glob is I
        prok is V
        pish is X
        tegj is L
        glob glob Silver is 34 Credits
        glob prok Gold is 57800 Credits
        pish pish Iron is 3910 Credits
        how much is pish tegj glob glob ?
        how many Credits is glob prok Silver ?
        how many Credits is glob prok Gold ?
        how many Credits is glob prok Iron ?
        how much wood could a woodchuck chuck if a woodchuck could chuck wood ?
      }
      ).should_output(%{
        pish tegj glob glob is 42
        glob prok Silver is 68 Credits
        glob prok Gold is 57800 Credits
        glob prok Iron is 780 Credits
        I have no idea what you are talking about        
      })
  end

  it "should handle galaxy numerals" do
    intergalactic_transaction(%{
        x1    is I
        x5    is V
        x10   is X
        x50   is L
        x100  is C
        x500  is D
        x1000 is M
        how much is x1000 x100 ?
        how much is x1 x1 ?
        how much is x1 x5 ?
      }
      ).should_output(%{
        x1000 x100 is 1100
        x1 x1 is 2
        x1 x5 is 4
      })
  end

  it "should handle unknown galaxy numerals" do
    intergalactic_transaction(%{
        how much is x1 X5 ?
      }
      ).should_output(%{
        I have no idea what you are talking about
      })
  end

  it "should handle incomplete transactions" do
    intergalactic_transaction(%{
        how much is  ?
          is I
        how many Credits is x5   ?
      }
      ).should_output(%{
        I have no idea what you are talking about
        I have no idea what you are talking about
        I have no idea what you are talking about
      })
  end

  it "should handle garbage transactions" do
    intergalactic_transaction(%{
        
        kjhkjhkj
        ,
        /
      }
      ).should_output(%{
        I have no idea what you are talking about
        I have no idea what you are talking about
        I have no idea what you are talking about
        I have no idea what you are talking about
      })
  end

  it "should calculate metal prices" do
    intergalactic_transaction(%{
        x1    is I
        x5    is V
        x10   is X
        x50   is L
        x100  is C
        x500  is D
        x1000 is M
        x1 Gold is 10 Credits
        x10 x50 x1 x1 Silver is 1302 Credits
        how many Credits is x5 Gold ?
        how many Credits is x1 Silver ?
      }
      ).should_output(%{
        x5 Gold is 50 Credits
        x1 Silver is 31 Credits
      })
  end

  it "should handle unknown metal" do
    intergalactic_transaction(%{
        x1    is I
        x5    is V
        x10   is X
        x50   is L
        x100  is C
        x500  is D
        x1000 is M
        x1 Gold is 10 Credits
        x10 x50 x1 x1 Silver is 1302 Credits
        how many Credits is x1 Gallium ?
      }
      ).should_output(%{
        I have no idea what you are talking about
      })
  end

  it "should handle known metal but incorrect galaxy numerals" do
    intergalactic_transaction(%{
        x1    is I
        x5    is V
        x10   is X
        x50   is L
        x100  is C
        x500  is D
        x1000 is MM
        1 Silver is 10x Credits
        x1 Gold is 10x Credits
        x10 x50 x1 x10000 Silver is 1302 Credits
        how many Credits is x1 x100000 Silver ?
      }
      ).should_output(%{
        I have no idea what you are talking about
        I have no idea what you are talking about
        I have no idea what you are talking about
        I have no idea what you are talking about
      })
  end
end