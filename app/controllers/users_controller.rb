class UsersController < Clearance::UsersController
  before_action :one_user_registered?, only: [:new, :create]

  protected

  def one_user_registered?
    if (User.count > 0)
      flash[:error] = "You cannot sign up, sorry!"
      redirect_to root_path
    else
      return
    end
  end
end
