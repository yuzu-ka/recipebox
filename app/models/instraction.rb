class Instraction < ApplicationRecord
  validates :content, length: { maximum: 255 }
  
  belongs_to :recipe
end
