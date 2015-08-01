class Person < ActiveRecord::Base
  has_one :house, foreign_key: :tenant_id

  validates :name, presence: true
  validates :nin, presence: true
end
