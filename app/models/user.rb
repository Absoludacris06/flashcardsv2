class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds, dependent: :destroy
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
    @user = User.new(
      :name => params[:name],
      :email => params[:email]
      )
    @user.password = params[:password]
    @user.save
    @user
  end


end
