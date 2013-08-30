get '/' do
  # Look in app/views/index.erb
  erb :index
end


post '/user' do 

  User.create(params)

end
