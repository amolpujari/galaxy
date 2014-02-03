module Galaxy
  class RomanNumeral
    class Decimalizer
      class << self
        def decimalize numeral
          @numeral = numeral
          tokenize
          tokens_valuation.reduce(:+)
        end

        def tokenize
          @tokens = []
          while( @numeral.length>0 ) do
            s1 = @numeral[0]
            s2 = @numeral[1]

            if subtractive_notations_valid? s1, s2
              @tokens << "#{s1}#{s2}"
              @numeral = @numeral[2..-1]

            else
              @tokens << s1
              @numeral = @numeral[1..-1]
            end
          end
        end

        SubtractiveNotationsPossibilities = %w{IV IX XL XC CD CM}

        def subtractive_notations_valid? s1, s2
          return false unless s2 and s1
          return false unless Symbols[s1] < Symbols[s2]
          return true if SubtractiveNotationsPossibilities.include? "#{s1}#{s2}"
          raise ArgumentError.new("Galaxy::RomanNumeral::Decimalizer: #{s1} cannot be placed before #{s2}.")
        end

        def tokens_valuation
          @token_values = @tokens.collect do |token|
            token.length==1 ? Symbols[token] : Symbols[token[1]] - Symbols[token[0]]
          end
        end
      end
    end
  end
end
