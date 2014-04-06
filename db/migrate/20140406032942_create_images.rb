class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :image_path
      
      t.integer :album_id
      t.integer :order

      t.timestamps
    end
  end
end
