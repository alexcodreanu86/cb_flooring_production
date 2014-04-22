class Jobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.belongs_to :customer
      t.date :completed_at
      t.string :address
      t.text :description
      
      t.timestamps
    end
  end
end
