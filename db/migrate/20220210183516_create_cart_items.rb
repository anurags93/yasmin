class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.belongs_to :menu
      t.belongs_to :user
      t.timestamps
    end
  end
end
