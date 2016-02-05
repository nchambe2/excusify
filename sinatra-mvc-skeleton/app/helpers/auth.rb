helpers do
  def current_user
   return session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def not_authorized
      if current_user && current_user.id != @excuse.creator_id
        halt(404, erb(:'404'))
      end
  end
end
