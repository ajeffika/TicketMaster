module IncidentScopeHelper
  def groups_scope
  User.first.groups.each { |x| @current_groups = x }
  @current_groups
  end
end