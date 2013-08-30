post '/user' do 
  @user = User.create(params)
  if @user.save
    session["user_id"] = @user.id
  else
    @error = "Please try again"
  end
end
