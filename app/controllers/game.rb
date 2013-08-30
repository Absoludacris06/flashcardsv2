
post ('/round') do
  @round = Round.create(user_id: session[:user_id], deck_id: session[:deck_id])
  session[:round_id] = @round.id
  session[:deck] = Deck.find(@round.deck_id).cards.shuffle
  session[:card] = session[:deck].pop
  erb :guess
end

post ('/guess') do
  if session[:deck].empty?
    erb :results
  else
    if session[:card].answer == params[:guess]
      @correct = 1
    else
      @correct = 0
    end
    @guess = Guess.create(card_id: session[:card].id, round_id: session[:round_id], correctness: @correct)
    session[:card] = session[:deck].pop
    erb :guess
  end
end
