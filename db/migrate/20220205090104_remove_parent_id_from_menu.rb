class RemoveParentIdFromMenu < ActiveRecord::Migration[5.0]
  def change
    remove_column :menus, :parent_id
  end
end
