module UserHelper
  def determine_age(user)
    age = DateTime.now.year - user.birth_date.year
  end
end