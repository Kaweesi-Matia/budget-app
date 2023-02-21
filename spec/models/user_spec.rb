require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(email: 'matiakaweesi@gmail.com', password: '111111',
                     password_confirmation: '111111')
    @user.save

    @category = Category.new(name: 'first category')

    @category.save

    @transaction = Transaction.new(name: 'first transaction', amount: 700)

    @transaction.save
  end

  it 'user should be valid' do
    expect(@user).to be_valid
  end

  it ' user should possess an email' do
    @user.email
    expect(@user.email).to eq('matiakaweesi@gmail.com')
  end

  it 'user should have a password' do
    @user.password
    expect(@user.password).to eq('111111')
  end

  it 'should have the password confirmation' do
    @user.password_confirmation
    expect(@user.password_confirmation).to eq('111111')
  end
end
