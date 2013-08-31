post '/user/new' do 
  @user = User.create(name: params[:name], email: params[:email], password: params[:password])
  puts @user
  puts @user.class
  if @user.valid?
    session[:user_id] = @user.id
    erb :dashboard
  else
    @errors = @user.errors.full_messages
    erb :signup_error
  end

end

post '/user' do
  @user = User.find_by_email(params[:email])
  
  if !@user.nil? && @user.password == params[:password] 
    session[:user_id] = @user.id
    erb :dashboard
  else
    @error = "Incorrect Email/Password Combination"
    erb :login_error
  end

end


get '/logout' do 
  session.clear
  redirect '/'
end


get '/dashboard' do 
  erb :dashboard
end
