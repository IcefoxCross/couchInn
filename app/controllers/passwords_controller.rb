class PasswordsController < Devise::PasswordsController

  def create
  	pwd = User.where("email = ?", params["user"]["email"]).first
  	pwd.password = "12345"
  	pwd.save
  	redirect_to login_path, notice: 'Contraseña reiniciada.'
  end

  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
  end
end