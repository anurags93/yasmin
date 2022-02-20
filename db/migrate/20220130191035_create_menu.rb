class CreateMenu < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :parent_id
      t.belongs_to :menu_category
      t.integer :menu_choice
      t.text :description
      t.float :price
      t.integer :stock
      t.string :display
      t.integer :sort_order , default:0
      t.timestamps

    end
  end
end
