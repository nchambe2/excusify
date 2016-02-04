get "/excuses" do
 @excuses = Excuse.all
  erb :"excuses/index"
end