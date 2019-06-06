class IncidentsQuery
  def fetch
    Incident.joins(:group, :user).where('incidents.group = ?', User.first.groups)
  end
end
