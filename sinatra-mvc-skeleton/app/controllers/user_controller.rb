get "/users/new" do
  erb :"users/new"
end

post "/users" do
  user = User.new(first_name: params[:first_name],
                  last_name: params[:last_name],
                  email: params[:email],
                  password: params[:password])
   if user.valid?
      user.save
      session[:user_id] = user.id
      redirect "/"
  else
      @errors = user.errors.full_messages
      erb :"users/new"
  end

end

get "/users/:id" do
  erb :"users/show"
end

