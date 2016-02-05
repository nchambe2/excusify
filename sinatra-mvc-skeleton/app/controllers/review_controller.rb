post "/excuses/:excuses_id/review" do
  p params
  excuse = Excuse.find(params[:excuses_id])
  @review = Review.new(rating: params[:value].to_i,
                       reviewer_id: current_user.id,
                       excuse_id: excuse.id)
  if @review.valid?
    @review.save
    redirect "/excuses"
  else
    @errors = @review.errors.full_messages
    @excuses  = Excuse.all
    erb :"excuses/index"
  end
end