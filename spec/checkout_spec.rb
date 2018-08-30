require './lib/checkout.rb'

describe Checkout do

    promotional_rules = {discount_threshold: 60, 
        discount_value: 0.1,
        product_discount: {
            product_code: 001,
            number_threshold: 2,
            discount_price: 8.5 }}

    subject { described_class.new(promotional_rules) }

    it 'should be able to pass in promotianal rules and return truthy' do
        expect(described_class.new(promotional_rules)).to be_truthy                                                
    end

    it 'should be able to access discount values' do 
        expect(subject.discount_threshold).to eq 60
        expect(subject.discount).to eq 0.1
    end



end