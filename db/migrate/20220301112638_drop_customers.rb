class DropCustomers < ActiveRecord::Migration[5.0]
   def change
    drop_table :customers do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.string :password
      t.string :address
      t.integer :pincode
      t.string :gender
      t.string :dob


      t.timestamps
    end
  end
end
