class ChangePriceColumnToMonetize < ActiveRecord::Migration[5.0]
  def change
        remove_column :menus, :price
        add_monetize :menus, :price, currency: { present: false }
        add_monetize :menus, :tax, currency: { present: false }
        add_monetize :menus, :net_amount, currency: { present: false }
  end
end
