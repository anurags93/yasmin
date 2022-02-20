class CreateTaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :taxes do |t|
     
       t.integer :gst
       t.float  :sgst
       t.float  :cgst
       t.datetime :date  
      t.timestamps
    end
  end
end
