module Galaxy
  class RomanNumeral
    class Validator
      class << self
        def validate numeral
          @numeral = numeral

          should_be_string
          should_not_be_blank
          should_contain_only_roman_symbols_I_V_X_L_C_D_and_M
          symbols_I_X_C_and_M_can_be_repeated_three_times_in_succession_but_no_more
          symbols_D_L_and_V_can_never_be_repeated_in_succession
        end

        private

        def raise_error method_error
          raise ArgumentError.new("#{self.name}: #{ method_error.to_s.gsub("_"," ")}.")
        end

        def should_be_string
          return if @numeral.is_a? String
          raise_error __method__
        end

        def should_not_be_blank
          return if @numeral.length>0
          raise_error __method__
        end

        def should_contain_only_roman_symbols_I_V_X_L_C_D_and_M
          return if @numeral.match /^[IVXLCDM]+$/
          raise_error __method__
        end

        def symbols_I_X_C_and_M_can_be_repeated_three_times_in_succession_but_no_more
          return unless @numeral.match /I{4,4}|X{4,4}|C{4,4}|M{4,4}/
          raise_error __method__
        end

        def symbols_D_L_and_V_can_never_be_repeated_in_succession
          return unless @numeral.match /D{2}|L{2}|V{2}/
          raise_error __method__
        end
      end
    end
  end
end
