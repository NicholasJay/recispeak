class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :phone_number
      t.string  :profile_pic
      t.string  :gender
      t.date    :birthday
      t.string  :facebook_url
      t.string  :twitter_name
      t.string  :address
      t.string  :city
      t.string  :state
      t.integer :zipcode
      t.string  :password_digest
    end
  end
end
