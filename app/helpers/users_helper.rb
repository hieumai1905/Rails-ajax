module UsersHelper
  def user_count
    User.all.size
  end
end