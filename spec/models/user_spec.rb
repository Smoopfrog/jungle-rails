require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Should be valid with a name, email, password and confirmation password' do
      @user = User.new(name: 'Bob', email: 'bobert@gmail.com', password: '1234', password_confirmation: '1234')
      
      expect(@user).to be_valid
    end

    it 'Should be invalid if name password is nill' do
      @user = User.new(name: 'Bob', email: 'bobert@gmail.com', password: nil, password_confirmation: '1234')
      
      expect(@user).to_not be_valid
    end

    it 'Should be invalid if name password_confirmation is nill' do
      @user = User.new(name: 'Bob', email: 'bobert@gmail.com', password: '123', password_confirmation: nil)
      
      expect(@user).to_not be_valid
    end

    it 'Should be invalid if name password doesn\'t equal password_confirmation' do
      @user = User.new(name: 'Bob', email: 'bobert@gmail.com', password: '123', password_confirmation: "1234")
      
      expect(@user).to_not be_valid
    end

    it 'Should be valid if name password equals password_confirmation' do
      @user = User.new(name: 'Bob', email: 'bobert@gmail.com', password: '1234', password_confirmation: "1234")
      
      expect(@user).to be_valid
    end
  end
end
