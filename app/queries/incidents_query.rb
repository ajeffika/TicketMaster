# frozen_string_literal: true

class IncidentsQuery
  def initialize
    ### Placeholder - for now
    @user_groups = User.first.groups
  end

  def fetch
    Incident.where(group_id: @user_groups.pluck(:id))
  end
end
