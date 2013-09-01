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

get '/stats' do
  @current_user = User.find(session[:user_id])
  subjects = []
  percentages = []
  rounds = @current_user.rounds.order("created_at DESC")
  rounds.each do |round|
    correct_guesses = round.guesses.where(correctness: 1).count
    total_guesses = round.guesses.count
    percentages << correct_guesses.percent_of(total_guesses).round(2)
    subjects << Deck.find(round.deck_id).subject
    # only call on @current_user, @round_stats in erb
  end
  @round_stats = subjects.zip(percentages) # [[sub, perc], [sub, perc],...]
  erb :stats
end
