helpers do
# This will return the current user, if they exist
# Replace with code that works with your application
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end

  class Numeric
    def percent_of(n)
      self.to_f / n.to_f * 100.0
    end
  end

# Note: the brackets () around number are optional
# p (1).percent_of(10)    # => 10.0  (%)
# p (200).percent_of(100) # => 200.0 (%)
# p (0.5).percent_of(20)  # => 2.5   (%)

end
