# frozen_string_literal: true

class User < ApplicationRecord
  has_many :incidents
  has_many :addresses
  has_many :group_squads
  has_many :groups, through: :group_squads
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
