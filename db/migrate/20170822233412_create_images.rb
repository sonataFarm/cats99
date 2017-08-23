class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :cat_id, null: false
      t.string :url, null: false
      t.integer :ord, null: false
      t.timestamps
    end
  end
end
