class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :item
      t.text :description

      t.timestamps null: false
    end
  end
end
