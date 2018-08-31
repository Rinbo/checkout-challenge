require './lib/checkout.rb'
require 'pry'

describe Checkout do

    promotional_rules = {discount_threshold: 60, 
        discount_value: 0.1,
        product_discount: {
            '001': { 
                number_threshold: 2,
                discount_price: 8.5 }}}
    inventory = {'001': {
                    name: "Lavender heart",
                    price: 9.25},
                '002': {
                    name: "Personalised cufflinks",
                    price: 45},
                '003': {
                    name: "Kids T-shirt",
                    price: 19.95} }

    subject { described_class.new(promotional_rules) }

    it 'should be able to pass in promotianal rules and return truthy' do
        expect(described_class.new(promotional_rules)).to be_truthy                                                
    end

    it 'should be able to access discount values' do 
        expect(subject.discount_threshold).to eq 60
        expect(subject.discount).to eq 0.1
        expect(subject.product_discount).to_not be nil
    end

    it 'should be able to scan products' do 
        expect(subject.scan('001')).to be_truthy
    end

    it 'should be able to add items to shopping cart by scanning' do
        subject.scan('001')
        subject.scan('001')
        expect(subject.shopping_cart[:"001"]).to eq 2
    end

    it 'should be able to show which items have currently been scanned' do
        subject.scan('001')
        subject.scan('001')
        subject.scan('002')
        expect(subject.shopping_cart).to eq({'001': 2, '002': 1})
    end       

    it 'should be able to provide items and prices in store' do
        expect(subject.inventory).to eq inventory
    end

    it 'should be able to provide the total price of scanned items' do
        subject.scan('001')
        subject.scan('003')              
        expect(subject.total). to eq 29.2
    end

    it 'should be able to incorporate global discount according to promotional rules' do
        subject.scan('001')
        subject.scan('002')
        subject.scan('003')
        expect(subject.total).to eq 66.78   
    end

    it 'should be able to incorporate product discount based on number of items' do
        subject.scan('001')
        subject.scan('002')
        subject.scan('003')
        subject.scan('001')
        expect(subject.total).to eq 73.76
        
    end
    
end
