class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end 
  end

  def destroy
    @user = current_user
    
    if @user.destroy
      render json: {}, status: :no_content
    else
      render json: {}, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
