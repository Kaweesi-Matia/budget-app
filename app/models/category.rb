class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  has_one_attached :icon

  def total_amount
    transactions.sum(:amount)
  end
end
