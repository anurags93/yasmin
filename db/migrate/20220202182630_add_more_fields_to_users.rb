class AddMoreFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
      add_column :users, :contact, :string
      add_column :users, :type, :string
      add_column :users, :dob, :string
      add_column :users, :address, :string
      add_column :users, :pincode, :string

  end
end
