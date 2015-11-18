class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    current_user # Or :prefix_to_your_route
  end

  def sign_up_params
  	params.require(:user).permit(:name, :lastName, :age, :email, :password, :password_confirmation)
  end

  def account_update_params
  	params.require(:user).permit(:name, :lastName, :age, :email, :password, :password_confirmation, :current_password)
  end
end