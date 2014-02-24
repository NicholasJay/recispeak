class CreateRecipeComments < ActiveRecord::Migration
  def change
    create_table :recipe_comments do |t|
      t.timestamps
      t.text :comments
      t.string :photo
      t.references :user
      t.references :recipe
    end
  end
end
