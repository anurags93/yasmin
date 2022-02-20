class AddTaxIdToMenuCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :menu_categories, :tax, index: true
  end
end
