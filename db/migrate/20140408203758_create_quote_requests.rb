class CreateQuoteRequests < ActiveRecord::Migration
  def change
    create_table :quote_requests do |t|
      t.string :phone
      t.string :name
      t.text :message
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
