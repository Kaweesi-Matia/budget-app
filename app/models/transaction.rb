class Transaction < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories, dependent: :destroy

  validates :name, :amount, presence: true, length: { maximum: 255 }
  validates :amount, numericality: { greater_than: 0 }
end
