class IncidentPolicy < ApplicationPolicy
  attr_reader :user

  def update?
    user.admin?
  end

  def delete?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end