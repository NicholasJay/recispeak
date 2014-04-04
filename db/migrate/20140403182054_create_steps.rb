class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :step_number
      t.references :recipe
    end
  end
end
