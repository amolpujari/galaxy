module Galaxy
  class CalcGalaxyNumerical < MessageProcessor::Base
    def process
      galaxy_numeral = Galaxy::Numeral.new @match[1] rescue nil
      return super unless galaxy_numeral
      
      decimal = galaxy_numeral.to_decimal
      return super unless decimal

      puts "#{@match[1].strip} is #{decimal}"
    end
  end
end