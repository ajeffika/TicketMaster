class IncidentPolicy < ApplicationPolicy

  def index?
    true
  end

  def update?
    user.admin? or determine_user
  end

  def show?
    user.admin? or determine_user
  end

  def delete?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  private

  def determine_user
    if incident.created_by == user.id
    end
  end
end
