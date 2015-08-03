class House < ActiveRecord::Base
  belongs_to :tenant, class_name: 'Person', foreign_key: :person_id

  scope :available, -> { where(tenant: nil)}

  validates :title, presence: true
  validates :address, presence: true
  validates :postcode, presence: true

  before_save :update_water_supplier
  after_save :nofify_supplier

  private
    def update_water_supplier
      if postcode_changed?
        if Scrapers::ThamesWater.new.is_supplier?(postcode)
          self.supplier = "ThamesWater"
        elsif Scrapers::AffinityWater.new.is_supplier?(postcode)
          self.supplier = "AffinityWater"
        end
      end
    end

    def nofify_supplier
      if person_id_changed? and !tenant.nil? and !supplier.nil?
        "Scrapers::#{self.supplier}".to_s.classify.constantize.new.notify(self)
      end
    end
end
