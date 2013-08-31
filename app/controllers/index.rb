get '/' do
  # Look in app/views/index.erb
  if logged_in?
    erb :dashboard
  else  
    erb :index
  end
     
end



