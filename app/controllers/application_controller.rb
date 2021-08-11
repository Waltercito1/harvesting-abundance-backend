class ApplicationController < ActionController::API
    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
            devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password) }
        end
end
