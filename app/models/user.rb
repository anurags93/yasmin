class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :avatar, as: :imagable         
  def customer?
    type == 'Customer'
  end

  def seller?
    type == 'Seller'
  end

  Roles = [ :admin , :manager ]

  def is?( requested_role )

    self.role == requested_role.to_s
  end
end
