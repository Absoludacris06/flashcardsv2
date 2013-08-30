post '/user/new' do 
  @user = User.create(params)
  if @user.save
    session["user_id"] = @user.id
  else
    @error = "Please try again"
  end
end

post '/user' do

  @user = User.find_by_email(params[:email])
  
  if @user.password == params[:password]
    session["user_id"] = @user.id
  else
    @invalid = "Invalid password and username combination"
  end

  erb :index

end

