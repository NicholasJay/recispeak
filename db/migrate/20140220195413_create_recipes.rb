class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :category
      t.string :title
      t.text :notes
      t.string :recipe_photo
      t.boolean :public_private
      t.references :user
      t.timestamps
    end
  end
end
