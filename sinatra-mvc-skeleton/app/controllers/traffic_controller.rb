get "/traffic" do
  ENV["GOOGLE_KEY"]
  erb :"traffic/index"
end