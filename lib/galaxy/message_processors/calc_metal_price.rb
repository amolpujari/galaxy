module Galaxy
  class CalcMetalPrice < MessageProcessor::Base
    def process
      metal_units_in_galaxy_numeral = @match[1]
      metal_units_in_decimal = Galaxy::Numeral.new(metal_units_in_galaxy_numeral).to_decimal
      return super unless metal_units_in_decimal
      
      metal_name = @match[2]
      return super unless Metal.cost_per_decimal_unit_for( metal_name )
      
      metal_cost_in_decimals = Metal.cost_per_decimal_unit_for( metal_name ) * metal_units_in_decimal

      puts "#{metal_units_in_galaxy_numeral} #{metal_name} is #{metal_cost_in_decimals.to_i} Credits"
    end
  end
end
