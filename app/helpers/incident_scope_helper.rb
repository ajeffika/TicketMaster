# frozen_string_literal: true

module IncidentScopeHelper
  def groups_scope
    @current_groups = []
    User.first.groups.each { |x| @current_groups << x }
    @current_groups
  end
end
