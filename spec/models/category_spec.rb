require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(email: 'matiakaweesi@gmail.com', password: '111111',
                     password_confirmation: '111111')
    @user.save

    @category = Category.new(name: 'first category')

    @category.save

    @transaction = Transaction.new(name: 'first transaction', amount: 600)

    @category.transactions << @transaction
  end

  it ' should contain name' do
    @category.name
    expect(@category.name).to eq('first category')
  end

  it ' should contain a transaction' do
    @category.transactions
    expect(@category.transactions).to eq([@transaction])
  end
end
