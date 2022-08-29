require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should be valid with a name, price, quantity and category' do
      @category = Category.new(name: 'test category')
      @product = Product.new(name: 'test product', price_cents: 100, quantity: 10, category: @category)
      expect(@product).to be_valid
    end
    
    it 'should return error message if name is nil' do
      @category = Category.new(name: 'test category')
      @product = Product.new(name: nil, price_cents: 100, quantity: 10, category: @category)

      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'should return error message if price is nil' do
      @category = Category.new(name: 'test category')
      @product = Product.new(name: 'test product', price_cents: nil, quantity: 10, category: @category)
      
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include "Price is not a number"
    end

    it 'should return error message if quantity is nil' do
      @category = Category.new(name: 'test category')
      @product = Product.new(name: 'test product', price_cents: 100, quantity: nil, category: @category)
      
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'should return error message if category is nil' do
      @product = Product.new(name: 'test product', price_cents: 100, quantity: 10, category: nil)
      
      expect(@product.valid?).to be false
      expect(@product.errors.full_messages).to include "Category must exist"
    end
  end
end
