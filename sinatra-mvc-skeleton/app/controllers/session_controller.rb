get '/login' do
  erb :"sessions/new"
end

post '/login' do
  p params
  user = User.find_by(email: params[:users][:email])
  if user && user.authenticate(params[:users][:password])
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = erb :"partials/_login_error_text", layout: false, locals: {errors: @errors}
    erb :"sessions/new"
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect "/"
end


