class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      if resource.class.name=="Customer"
        customers_my_page_path
      elsif resource.class.name=="Admin"
        admin_top_path
      end
    end
    def after_sign_up_path_for(resource)
        customers_my_page_path
    end
    def after_sign_out_path_for(resource)
      if resource == :customer
        root_path
      elsif resource == :admin
       new_admin_session_path
      end
    end

 protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:last_name,:last_name_kana,:first_name,:first_name_kana,:address,:postal_code,:telephone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end


end
