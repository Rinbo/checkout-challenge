# Checkout Challenge
## @CraftAcademy

Our marketing team want to offer promotions as an incentive for our customers to purchase these items.

If you spend over $60, then you get 10% off of your purchase.
If you buy 2 or more lavender hearts then the price drops to $8.50.
Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.

Promotional rules are represented in a hash like this:

~~~
promotional_rules = {discount_threshold: 60, 
        discount_value: 0.1,
        product_discount: {
            '001': { 
                number_threshold: 2,
                discount_price: 8.5 }}}
~~~

After creating an instance of 'Checkout' these can be updated by calling the attribute 'promotional_rules' on that instance. By default the above rules are loaded into the object if no other rules are passed.

The interface to our checkout looks like this:

~~~
co = Checkout.new(promotional_rules)
co.scan(item) #adds that item to the shopping_cart
co.scan(item) #adds that item to the shopping_cart
price = co.total #return the total price with discounts deducted
~~~
