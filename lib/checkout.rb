class Checkout

    attr_accessor :promotional_rules, :discount_threshold, :discount, :product_discount, :shopping_cart

    def initialize(promotional_rules = {})
        @promotional_rules = promotional_rules
        load_promotional_rules unless promotional_rules.empty?
        @shopping_cart = {}        
    end

    def scan(item)
        @shopping_cart[item.to_sym] == nil ? @shopping_cart[item.to_sym] = 1 : @shopping_cart[item.to_sym] += 1
    end

    

    private

    def load_promotional_rules
        @discount_threshold = @promotional_rules[:discount_threshold]
        @discount = @promotional_rules[:discount_value]
        @product_discount = @promotional_rules[:product_discount]
    end
    


end