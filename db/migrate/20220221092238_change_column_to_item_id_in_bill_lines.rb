class ChangeColumnToItemIdInBillLines < ActiveRecord::Migration[5.0]
  def change
    rename_column :bill_lines, :item_id, :menu_id
  end
end
