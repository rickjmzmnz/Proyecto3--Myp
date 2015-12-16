class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    #self.current_user = @user
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'Regresa pronto'
    end
    redirect_to root_path
  end
end
