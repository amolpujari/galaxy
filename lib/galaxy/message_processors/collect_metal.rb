module Galaxy
  class CollectMetal < MessageProcessor::Base
    def process
      galaxy_numeral = Galaxy::Numeral.new @match[1]
      metal_units_in_decimal = galaxy_numeral.to_decimal
      return unless metal_units_in_decimal

      metal_name = @match[2]
      cost_in_decimal = @match[3].to_i

      metal_cost_per_decimal_unit = cost_in_decimal/metal_units_in_decimal
      
      Metal.add metal_name, metal_cost_per_decimal_unit
    end
  end
end