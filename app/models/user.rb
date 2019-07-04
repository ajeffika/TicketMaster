# frozen_string_literal: true

class User < ApplicationRecord
  has_many :incidents
  belongs_to :address, optional: true
  has_many :group_squads
  has_many :groups, through: :group_squads
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  enum role: { normal: 0, admin: 1 }
end
