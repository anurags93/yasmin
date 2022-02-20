class CreatePincodes < ActiveRecord::Migration[5.0]
  def change
    create_table :pincodes do |t|
      t.string :pincode
      t.string :location
      t.timestamps
    end
  end
end
