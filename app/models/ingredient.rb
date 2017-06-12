class Ingredient < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, length: { maximum: 50 }
  
  belongs_to :recipe
end
