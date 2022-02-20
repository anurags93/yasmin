class CreateUserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |t|
      t.belongs_to :user
      t.string     :address_type
      t.string     :address
      t.string     :pincode
      t.timestamps
    end
  end
end
