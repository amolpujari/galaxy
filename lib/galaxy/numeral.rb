module Galaxy
  class Numeral
    Symbols = {}

    def self.add symbol, roman_numeric
      Symbols[symbol] = roman_numeric
    end

    def initialize numeral
      @numeral = numeral
      validate
      @numeral = "#{@numeral.strip} "
    end

    def to_roman_numeral
      return @roman_numeral if @roman_numeral

      roman_numeral = @numeral.dup
      Symbols.collect do |symbol, roman_numeric|
        symbol_collected = roman_numeral.gsub! "#{symbol} ", roman_numeric
      end
      
      @roman_numeral ||= RomanNumeral.new roman_numeral rescue nil
    end

    def to_decimal
      to_roman_numeral and to_roman_numeral.to_decimal
    end

    def validate
      unless @numeral.is_a? String
        raise ArgumentError.new "#{self.class}: must be a string."
      end

      @numeral = @numeral.to_s.strip

      if @numeral.length==0
        raise ArgumentError.new "#{self.class}: must not be blank."
      end
    end
  end
end