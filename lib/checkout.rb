class Checkout

    attr_accessor :promotional_rules, :discount_threshold, :discount

    def initialize(promotional_rules = {})
        @promotional_rules = promotional_rules
        load_promotional_rules unless promotional_rules.empty?        
    end

    

    private

    def load_promotional_rules
        @discount_threshold = @promotional_rules[:discount_threshold]
        @discount = @promotional_rules[:discount_value]

    end

    def extract_general_discount
    end
    
    def extract_product_discount
    end


end