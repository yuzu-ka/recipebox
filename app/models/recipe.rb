class Recipe < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, length: { maximum: 255 }
  validates :volume, presence: true, numericality: { only_integer: true, less_than: 10 }
  
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :instractions, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :instractions, allow_destroy: true
end
