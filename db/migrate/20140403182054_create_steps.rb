class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :step_number
      t.text :instructions
      t.references :recipe
    end
  end
end
