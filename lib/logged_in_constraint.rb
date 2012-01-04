class LoggedInConstraint < Struct.new(:value)
  def matches?(request)
    request.session[:user_id]
  end
end