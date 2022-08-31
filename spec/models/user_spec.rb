require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'Should be valid with a name, email, password and confirmation password' do
      @user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678')
      
      expect(@user).to be_valid
    end

    it 'Should be invalid if name password is nill' do
      @user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: nil, password_confirmation: '12345678')
      
      expect(@user).to_not be_valid
    end

    it 'Should be invalid if name password_confirmation is nill' do
      @user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '12345678', password_confirmation: nil)
      
      expect(@user).to_not be_valid
    end

    it 'Should be invalid if name password doesn\'t equal password_confirmation' do
      @user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '12345678', password_confirmation: "1234567891")
      
      expect(@user).to_not be_valid
    end

    it 'Should be valid if name password equals password_confirmation' do
      @user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '12345678', password_confirmation: "12345678")
      
      expect(@user).to be_valid
    end

    it 'Should be valid if name password is more than 7 characters' do
      @user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '12345678', password_confirmation: "12345678")
      
      expect(@user).to be_valid
    end

    it 'Should be invalid if name password is less than 8 characters' do
      @user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '1234567', password_confirmation: "1234567")
      
      expect(@user).to_not be_valid
    end

    it "Should be invalid if email already exists in the database" do
      user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '12345678', password_confirmation: "12345678")
      user.save

      user2 = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '12345678', password_confirmation: "12345678")
      user2.save
      
      expect(user2).to_not be_valid
    end


    it "Should be invalid if email already exists in the database with case sensitivity" do
      user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '12345678', password_confirmation: "12345678")
      user.save

      user2 = User.new(firstname: 'test', lastname: 'tester', email: 'TEST@gmail.com', password: '12345678', password_confirmation: "12345678")
      user2.save
      
      expect(user2).not_to be_valid
    end
  end

  describe 'authenticate_with_credentials' do
    it 'should login when valid credentials are passed' do
      user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678')
      user.save

      user = User.authenticate_with_credentials('test@gmail.com', '12345678')
      expect(user).not_to be(nil)
    end

    it 'should login with white space around email' do
      user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678')
      user.save

      user = User.authenticate_with_credentials(' test@gmail.com ', '12345678')
      expect(user).not_to be(nil)
    end
    it 'should ignore case for email and pass' do
      user = User.new(firstname: 'test', lastname: 'tester', email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678')
      user.save

      user = User.authenticate_with_credentials('TEST@gmail.com', '12345678')
      expect(user).not_to be(nil)
    end
  end
end
