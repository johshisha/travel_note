module SessionsHelper
  def log_in(user)
    p "log in ========#{user.id} ======="
    session[:user_id] = user.id
    p "loged in ========#{current_user.id} ======="
    p "logged in? #{logged_in?}"
    p session[:forwarding_url]
    p session[:user_id]
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
    p "logged in? #{logged_in?} in redirect_back_or"
    redirect_to(session[:forwarding_url] || default) # method終了までリダイレクト処理は行われない
    session.delete(:forwarding_url)
  end
  
  # remember url of before accessing
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
