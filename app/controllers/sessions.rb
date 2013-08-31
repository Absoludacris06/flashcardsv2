post '/user/new' do 
  @user = User.create(name: params[:name], email: params[:email], password: params[:password])
  puts @user
  puts @user.class
  if @user
    session[:user_id] = @user.id
    erb :dashboard
  else
    @error = "Please try again"
    redirect '/'
  end

end

post '/user' do

  @user = User.find_by_email(params[:email])
  
  if @user.password == params[:password]
    session[:user_id] = @user.id
    erb :dashboard
  else
    @invalid = "Invalid password and username combination"
    redirect '/'
  end

end


get '/logout' do 
  session.clear
  redirect '/'
end


get '/dashboard' do 
  erb :dashboard
end
