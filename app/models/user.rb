# frozen_string_literal: true

class User < ApplicationRecord
  cattr_accessor :current_user

  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_ouath2]

  include DeviseTokenAuth::Concerns::User
  extend Devise::Models

  has_many :incidents
  has_many :incidents, foreign_key: 'creator_id'
  has_many :incidents, foreign_key: 'modifier_id'
  belongs_to :address, optional: true
  has_many :group_squads
  has_many :groups, through: :group_squads
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { normal: 0, admin: 1 }
end
