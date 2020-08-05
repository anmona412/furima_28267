class BoughtBy < ApplicationRecord
  belongs_to :user
  belongs_to :item 
end
