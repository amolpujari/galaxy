module Galaxy
  class CollectGalaxySymbol < MessageProcessor::Base
    def process
      Numeral.add @match[1], @match[2]
    end
  end
end