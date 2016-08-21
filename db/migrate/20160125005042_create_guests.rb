class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :dietary
      t.text :dietary_text
      t.integer :menu_item

      t.timestamps null: false
    end
  end
end
