module Galaxy
  class Metal
    Metals = {}

    def self.add metal_name, metal_cost_per_decimal_unit
      Metals[metal_name] = metal_cost_per_decimal_unit
    end

    def self.cost_per_decimal_unit_for metal_name
      Metals[metal_name]
    end
  end
end