class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.permitted_sign_up_params
    [:name, :email, :password, :password_confirmation]
  end

  def self.permitted_update_params
    [:name, :email, :password, :password_confirmation, :current_password]
  end
end

