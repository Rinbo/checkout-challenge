
class Checkout

    attr_accessor :promotional_rules, :discount_threshold, :discount, 
                    :product_discount, :shopping_cart, :inventory

    def initialize(promotional_rules = {})
        promotional_rules.empty? ? load_default_rules : @promotional_rules = promotional_rules
        parse_promotional_rules
        @shopping_cart = {}
        load_inventory              
    end

    def scan(item)
        input_error if item.is_a? Integer
        @shopping_cart[item.to_sym].nil? ? @shopping_cart[item.to_sym] = 1 : @shopping_cart[item.to_sym] += 1
    end

    def total
        calculate_price
    end

    private

    def input_error
        raise TypeError, "Product code must be passed as a string"

    end

    def calculate_price
        total_sum = 0        
        @shopping_cart.each do |product_code, number_of_items|
            sub_total = 0
            sub_total = get_price(product_code, number_of_items) * number_of_items
            total_sum += sub_total       
        end
        total_sum > @discount_threshold ? (total_sum * (1 - @discount)).round(2) : total_sum.round(2)           
    end

    def get_price(product_code, number_of_items)
        
        if @product_discount[product_code.to_sym] != nil
            calculate_product_discount(product_code, number_of_items)
        else 
            @inventory[product_code.to_sym][:price]            
        end
              
    end

    def calculate_product_discount(product_code, number_of_items)
        if number_of_items >= @product_discount[product_code.to_sym][:number_threshold]
            @product_discount[product_code.to_sym][:discount_price]
        else
            @inventory[product_code.to_sym][:price]
        end        
    end

    def parse_promotional_rules
        @discount_threshold = @promotional_rules[:discount_threshold]
        @discount = @promotional_rules[:discount_value]
        @product_discount = @promotional_rules[:product_discount]
    end
    
    def load_inventory
        @inventory = {
                    '001': {
                        name: "Lavender heart",
                        price: 9.25},
                    '002': {
                        name: "Personalised cufflinks",
                        price: 45},
                    '003': {
                        name: "Kids T-shirt",
                        price: 19.95} }
    end

    def load_default_rules
        @promotional_rules = {discount_threshold: 60, 
            discount_value: 0.1,
            product_discount: {
                '001': { 
                    number_threshold: 2,
                    discount_price: 8.5 }}}
    end
end