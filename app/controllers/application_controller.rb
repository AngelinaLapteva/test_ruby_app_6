class ApplicationController < ActionController::Base
  def hello
    # now in this methond we need to specify our template to show
    # render html: 'Hello world'
    # but instead it is better to use html.erb files from views/layouts folder
  end

  #  !!! whatever methods are in this ApplicationController, they will be available to all other controllers  def current_user
  
  # to make current user available on views (html.erb files)
  helper_method :current_user, :logged_in?
  
  def current_user
    # we can access user who is logged it simple using seesion key word]
    # but also we need to check if that session exists with user in it
    # User.find(session[:user_id]) if session[:user_id]

    #  but instead of calling the DB all the time(like above method) we can do memoization means if have alreade referenced current user than we can reuse
    # return @current_user if such existed( means this function being called before) and if not check in DB

    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # will return true if current_user exists and return false if not

    !!current_user
  end

  # this function protects us to going to url like users/edit directly and trying to edit it from there
  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
