class User < ApplicationRecord

  has_and_belongs_to_many :incidents
  has_and_belongs_to_many :submitter_incidents, class_name: 'incident', foreign_key: 'submitter'
  has_and_belongs_to_many :responsible_for_incidents, class_name: 'incident', foreign_key: 'responsible'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
