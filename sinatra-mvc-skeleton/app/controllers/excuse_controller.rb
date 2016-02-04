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

get "/excuses/:id" do
  # not_authorized
  @excuse = Excuse.find(params[:id])
  erb :"excuses/show"
end

get "/excuses/:id/edit" do
  # not_authorized
  @excuse = Excuse.find(params[:id])
  erb :"excuses/edit"
end

put "/excuses/:id" do
  # not_authorized
  @excuse = Excuse.find(params[:id])
  @excuse.assign_attributes(body: params[:body])

  if @excuse.valid?
    @excuse.save
    redirect "/excuses/#{@excuse.id}"
  else
    @errors = @excuse.errors.full_messages
    erb :"excuses/edit"
  end
end

delete "/excuses/:id" do
  # not_authorized
  Excuse.find(params[:id]).destroy
  redirect "/excuses"
end