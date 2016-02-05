post "/excuses/:excuses_id/review" do
  excuse = Excuse.find(params[:excuses_id])

  review = excuse.reviews.find_by(reviewer: current_user)
  if review
    review.assign_attributes(rating: params[:example])
  else
    review = Review.new(rating: params[:example],
                         reviewer_id: current_user.id,
                         excuse_id: excuse.id)
  end

  #return a partial where the button is checked
  if review.save
    if request.xhr?
        content_type :json
        {
          rating_value: review.rating
        }.to_json
    else
      redirect "/excuses"
    end
  else
    @errors = review.errors.full_messages
    @excuses = Excuse.all
    erb :"excuses/index"
  end
end