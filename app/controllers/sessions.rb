post '/user/new' do 
  @user = User.create(name: params[:name], email: params[:email], password: params[:password])
  puts @user
  puts @user.class
  if @user
    session[:user_id] = @user.id
  else
    @error = "Please try again"
  end

  redirect '/'
end

post '/user' do

  @user = User.find_by_email(params[:email])
  
  if @user.password == params[:password]
    session[:user_id] = @user.id
  else
    @invalid = "Invalid password and username combination"
  end

  redirect '/'
end


get '/logout' do 
  session.clear
  redirect '/'
end


get '/dashboard' do 
  erb :dashboard
end
