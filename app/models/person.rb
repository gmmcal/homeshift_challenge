class Person < ActiveRecord::Base
  scope :available, -> { where.not(id: House.all.map(&:person_id)) }

  has_one :house, foreign_key: :person_id

  validates :name, presence: true
  validates :nin, presence: true
end
