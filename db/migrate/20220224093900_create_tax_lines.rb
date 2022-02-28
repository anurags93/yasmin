class CreateTaxLines < ActiveRecord::Migration[5.0]
  def change
    create_table :tax_lines do |t|
      t.belongs_to :tax
      t.belongs_to :bill
      t.integer :tax_percent
      t.float :cgst_percent
      t.float :sgst_percent
      t.timestamps
    end
  end
end
