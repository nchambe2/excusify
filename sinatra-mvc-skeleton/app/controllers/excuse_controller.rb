get "/excuses" do
 @excuses = Excuse.all
  erb :"excuses/index"
end

get "/excuses/new" do
  erb :"excuses/new"
end

post "/excuses" do
  excuse = Excuse.new(body: params[:body],
                      creator: current_user)

  if excuse.valid?
    excuse.save
    redirect "/excuses"
  else
   @errors = excuse.errors.full_messages
   erb :"excuses/new"
  end
end
