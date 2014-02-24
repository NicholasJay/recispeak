class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :recipe_info
      t.string :recipe_photo
      t.string :public_private
      t.references :user
      t.timestamps
    end
  end
end
