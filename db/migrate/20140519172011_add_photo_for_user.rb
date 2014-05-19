class AddPhotoForUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :profile_pic
      t.attachment :profile_pic
    end
  end
end
