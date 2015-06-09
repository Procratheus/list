class Api::ListsController < ApiController
  before_action :authenticated?

  def index 
    @lists = List.all
    render json: @lists, each_serializer: ListSerializer
  end

  def create
    @list = current_user.build_list(list_params)

    if @list.save
      render json: @list
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @list = current_user.list.find(params[:id])
    
    if @list.update(list_params)
      render json: @list
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @list = current_user.list.find(params[:id])

    if @list.destroy
      render json: {}, status: :no_content
    else
      render json: {}, status: :not_found
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :permissions)
  end
  
end