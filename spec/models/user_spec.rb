require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User validations' do
    it 'password and password_confirmation should equal for valid user' do
      user = User.create(first_name: "abc", last_name:"def", email:"a@gmail.com", password:"123", password_confirmation:"123")
      expect(user).to be_valid
    end

    it 'password and password_confirmation not equal leads to invalid user' do
      user = User.create(first_name: "abc", last_name:"def", email:"a@gmail.com", password:"1234", password_confirmation:"123")
      expect(user).to_not be_valid
    end

    it 'password minimum length should be 3' do
      user = User.create(first_name: "abc", last_name:"def", email:"a@gmail.com", password:"123", password_confirmation:"123")
      expect(user).to be_valid
    end

    it 'password minimum length should be 3, less is invalid' do
      user = User.create(first_name: "abc", last_name:"def", email:"a@gmail.com", password:"12", password_confirmation:"12")
      expect(user).to_not be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'login valid user' do 
      user = User.create(first_name: 'hi', last_name:"ji",email: 'n@n.com', password: "1345", password_confirmation: '1345')
      userA = User.authenticate_with_credentials(user.email, user.password)
      expect(userA.id).to be user.id
    end
    it 'login valid user with spaces in email' do 
      user = User.create(first_name: 'hi', last_name:"ji", email: 'n@n.com', password: "1345", password_confirmation: '1345')
      userA = User.authenticate_with_credentials(' n@n.com ', user.password)
      expect(userA.id).to be user.id
    end

    it 'login valid user with casing in email' do 
      user = User.create(first_name: 'hi', last_name:"ji", email: 'n@n.com', password: "1345", password_confirmation: '1345')
      userA = User.authenticate_with_credentials('N@N.cOm', user.password)
      expect(userA.id).to be user.id
    end
  end
  
end
