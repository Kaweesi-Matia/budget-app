require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(email: 'matiakaweesi@gmail.com', password: '111111',
                     password_confirmation: '111111')
    @user.save

    @category = Category.new(name: 'first category')

    @category.save

    @transaction = Transaction.new(name: 'first transaction', amount: 450)

    @category.transactions << @transaction

    @user.categories << @category
  end

  it 'should contain Name' do
    @transaction.name
    expect(@transaction.name).to eq('first transaction')
  end

  it 'should contain amount in numeric value' do
    @transaction.amount
    expect(@transaction.amount).to eq(450)
  end

  it 'transaction should belong to a category' do
    @transaction.categories
    expect(@transaction.categories).to eq(@transaction.categories)
  end
end
