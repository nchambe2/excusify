helpers do
  def current_user
   return session[:user_id] ? User.find(session[:user_id]) : nil
  end
end
