get "/excuses/:excuse_id/comments" do
  #unsure of comments index ???
  @excuse = Excuse.find(params[:excuse_id])
  erb :"comments/index"
end

post "/excuses/:excuse_id/comments" do
  excuse = Excuse.find(params[:excuse_id])
  comment = Comment.new(body: params[:comment_body],
                        commenter: current_user,
                        excuse_id: params[:excuse_id])
  if comment.valid?
    comment.save
    redirect "/excuses/#{excuse.id}/comments"
  else
    @errors = comment.errors.full_messages
    erb :"comments/index"
  end
end

get "/excuses/:excuse_id/comments/:id/edit" do
  @comment = Comment.find(params[:id])
  @excuse  = Excuse.find(params[:excuse_id])
  erb :"comments/edit"
end

put "/excuses/:excuse_id/comments/:id" do
  excuse  = Excuse.find(params[:excuse_id])
  comment = Comment.find(params[:id])

  comment.assign_attributes(body: params[:comment_body])

  if comment.valid?
    comment.save
    redirect "/excuses/#{excuse.id}/comments"
  else
    @errors = comment.errors.full_messages
    erb :"comments/edit"
  end
end

delete "/excuses/:excuse_id/comments/:id" do
  excuse = Excuse.find(params[:excuse_id])
  Comment.find(params[:id]).destroy
  redirect "/excuses/#{excuse.id}/comments"
end
