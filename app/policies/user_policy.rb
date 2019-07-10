class UserPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin?
  end

  def update?
    user.admin? or user.id == current_user.id
  end

  def destroy?
    user.admin?
  end

  def create?
    user.admin?
  end
end