class House < ActiveRecord::Base
  belongs_to :tenant, class_name: 'Person'

  validates :title, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
end
