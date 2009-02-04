class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :lead_id
      t.string :title
      t.string :permalink
      t.boolean :featured
      t.integer :status_id
      t.boolean :display
      t.decimal :price
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :mls
      t.string :property_taxes
      t.string :frontage
      t.string :depth
      t.string :lot_area
      t.string :finished_area
      t.string :year_built
      t.string :bedrooms
      t.string :bathrooms
      t.boolean :furnished
      t.string :garage
      t.text :basement
      t.text :space_details
      t.text :construction_details
      t.text :features
      t.text :sales_notes
      t.timestamps
    end
  end
  
  def self.down
    drop_table :listings
  end
end
