class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json
  
  def authorize
    render json: {message: "You must be signed in to access that page"} if current_user.nil?
  end
  
  def authenticate_admin
    @current_user ||= User.find_by_email(params[:email]) 
    
    if @current_user && @current_user.backend_admin?
      session[:user_id] = user.id
      return true
    end
  end
  
  private
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
    

end
