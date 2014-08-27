class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  # after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (!request.fullpath.match("/users") &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_update_path_for(resource)
    session[:previous_url] || root_path
  end

  def pending_count
    Reservation.where(:bicycle_id => current_user.bicycles.ids, status: 'pending').count
  end
  helper_method :pending_count

  def upcoming_count
    Reservation.where(from_date: (Time.now.midnight)..(Time.now.midnight + 1.week), status: 'approved', user_id: current_user.id).count
  end
  helper_method :upcoming_count

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :phone_number, :location, :description) }
    end

end
