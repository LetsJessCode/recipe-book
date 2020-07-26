class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text  :name
      t.integer :time_min
      t.integer :time_hr
      t.integer :prep_min
      t.integer :prep_hr
      t.integer :servings
      t.text :meal_type
      t.string :ingredients
      t.string :instructions
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
