class MenuCategory < ApplicationRecord
    belongs_to :parent, :class_name => 'MenuCategory'
  has_many :children, :class_name => 'MenuCategory', :foreign_key => 'cat_parent'
                   
end