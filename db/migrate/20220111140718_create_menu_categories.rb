class CreateMenuCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_categories do |t|
      t.string :cat_name 
      t.string :cat_parent,              null: false, default: "0"
      t.string :sort_order,              null: false, default: "0"
    end
  end
end
