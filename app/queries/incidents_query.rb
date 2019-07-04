# frozen_string_literal: true

class IncidentsQuery
  def initialize(user)
    @user_groups = user.groups
  end

  def fetch
    Incident.where(group_id: @user_groups.pluck(:id))
  end
end
