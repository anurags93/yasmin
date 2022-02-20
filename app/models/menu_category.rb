class MenuCategory < ApplicationRecord
    belongs_to :parent, :class_name => 'MenuCategory', optional: true
    has_many :children, :class_name => 'MenuCategory', :foreign_key => 'parent_id'
    has_many :menus 
    belongs_to :tax 
    scope :parentq, -> { where(parent_id: nil) }
      
     validates :name, presence: true              
end