class CreateMenuCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :menu_categories do |t|
      t.string :name 
      t.references :parent, foreign_key: {to_table: :menu_categories}             
      t.integer :sort_order,              default: 0
      t.timestamps 
    end
  end
end
