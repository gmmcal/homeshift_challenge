class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :nin, presence: true
end
