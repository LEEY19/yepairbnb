class UsersController < Clearance::UsersController
  before_action :find_user, only: [:show, :update, :edit]

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      @users = User.all
      redirect_to welcome_home_url
    else
      render template: "users/new"
    end
  end

  def show
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Your profile is edited!"
    else
      render 'edit'
    end
  end

  private

  def user_params   
    params.require(:user).permit(:email, :password, :first_name, :last_name, :birthday, :avatar)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
