class Api::ListsController < ApiController
  before_action :authenticated?

  def create
    @user = User.find(params[:user_id])
    @list = @user.list.new(list_params)

    if @list.save
      render json: @list
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:user_id])
    @list = @user.list.find(params[:id])
    
    if @list.update(list_params)
      render json: @list
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])

    if @list.destroy
      render json: {}, status: :no_content
    else
      redner json: {}, status: :not_found
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :permissions)
  end
  
end