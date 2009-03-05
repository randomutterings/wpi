class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :name
      t.text :description
      t.string :content_file_name
      t.string :content_content_type
      t.string :content_file_size
      t.timestamps
    end
  end
  
  def self.down
    drop_table :documents
  end
end
