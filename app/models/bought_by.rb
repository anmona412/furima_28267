class BoughtBy < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :street, class_name:"Transaction"
end
