class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :imagable_id
      t.string :imagable_type
      t.string :name
      t.text :description
      t.string :image_url
      t.string :image
      t.timestamps
    end
  end
end
