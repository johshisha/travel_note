module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # check correct user
  def current_user?(user)
    user == current_user
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  # redirect to remembered url
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default) # method終了までリダイレクト処理は行われない
    session.delete(:forwarding_url)
  end
  
  # remember url of before accessing
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
