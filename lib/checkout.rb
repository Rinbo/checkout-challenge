class Checkout

    attr_accessor :promotional_rules, :discount_threshold, :discount, :product_discount

    def initialize(promotional_rules = {})
        @promotional_rules = promotional_rules
        load_promotional_rules unless promotional_rules.empty?
        @shopping_cart = {}        
    end

    def scan(item)
        @shopping_cart.keys.include?(:item) == nil ? @shoppin_cart[:item] = 1 : @shoppint_cart[:item] +=1
    end

    

    private

    def load_promotional_rules
        @discount_threshold = @promotional_rules[:discount_threshold]
        @discount = @promotional_rules[:discount_value]
        @product_discount = @promotional_rules[:product_discount]
    end
    


end