class CreateRecipeBooks < ActiveRecord::Migration
  def change
    create_table :recipe_books do |t|
      t.string :title
      t.string :cover_photo
      t.references :user
      t.references :recipe
      t.timestamps
    end
  end
end
