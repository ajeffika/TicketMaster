# frozen_string_literal: true

class IncidentsQuery
  def initialize(user)
    @user_groups = user.groups
  end

  def fetch
    x = Incident.includes(:contractor).where(group_id: @user_groups.pluck(:id))
    # Contractor.where(contractor_id: x.pluck(:contractor_id))
  end
end
