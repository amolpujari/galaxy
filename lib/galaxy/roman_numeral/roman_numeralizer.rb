module Galaxy
  class RomanNumeral
    class RomanNumeralizer
      class << self
        Digits = {
                1000 => "M",
                900  => "CM", 500 => "D", 400 => "CD", 100 => "C",
                90   => "XC", 50  => "L", 40  => "XL", 10  => "X",
                9    => "IX", 5   => "V", 4   => "IV", 1   => "I"
            }        

        def numeralize decimal
          @decimal = decimal

          validate

          num = @decimal

          @numeral = Digits.map do |key, numeral|
            occurances, num = num.divmod(key)
            numeral * occurances
          end.join
        end

        private

        def validate
          should_be_an_integer
          should_be_between_1_and_3999
        end

        def raise_error method_error
          raise ArgumentError.new("#{self.name}: #{ method_error.to_s.gsub("_"," ")}.")
        end

        def should_be_an_integer
          return if @decimal.is_a? Integer
          raise_error __method__
        end

        def should_be_between_1_and_3999
          return if 0 < @decimal  and @decimal < 4000
          raise_error __method__
        end
      end
    end
  end
end
