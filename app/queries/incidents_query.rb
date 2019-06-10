# frozen_string_literal: true

class IncidentsQuery

  def initialize
    @user_groups = User.first.groups
  end

  def fetch
    @user_groups.each do |z|
      Incident.joins(:group, :user).where('incidents.group_id = ?', z)
    end
  end
end
