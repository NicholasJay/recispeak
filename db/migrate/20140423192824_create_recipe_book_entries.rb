class CreateRecipeBookEntries < ActiveRecord::Migration
  def change
    create_table :recipe_book_entries do |t|
      t.references :recipe
      t.references :recipe_book
    end
  end
end
