class AddSupplierToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :supplier, :string
  end
end
