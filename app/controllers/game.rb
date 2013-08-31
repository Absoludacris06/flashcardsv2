
post ('/round') do
  @round = Round.create(user_id: session[:user_id], deck_id: params[:deck_id])
  session[:round_id] = @round.id
  session[:deck] = Deck.shuffled_card_ids(params[:deck_id])
  @card = Card.find(session[:deck].pop)
  erb :guess
end

post ('/guess') do
  if session[:deck].empty?
    redirect "/results"
  else
    if Card.find(params[:card_id]).answer == params[:guess] #turn into model method
      @correct = 1
    else
      @correct = 0
    end
    @guess = Guess.create(card_id: params[:card_id], round_id: session[:round_id], correctness: @correct)
    @card = Card.find(session[:deck].pop)
    erb :guess
  end
end

get ('/results') do

@definitions = Round.definition(session[:round_id])
@responses = Round.response(session[:round_id])
@answers = Round.answer(session[:round_id])

@results = Round.scores(@definition, @answer, @response)

  erb :results
end
