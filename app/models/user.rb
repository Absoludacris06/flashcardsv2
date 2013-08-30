class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, :uniqueness => true

    include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


  def self.create(params)
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.email = params[:email]
    @user.save!
  end


end
