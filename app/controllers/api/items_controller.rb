class Api::ItemsController < ApiController
  before_action :authenticated?

  def index
    @items = Item.all
  end

  def create
    @item = current_user.list.items.build(item_params)

    if @item.save
      render json: @item
    else
      render json: { errors: @item.errors.full_messages }
    end
  end

  def update
    @item = current_user.list.items.find(params[:id])
    
    if @item.update(list_params)
      render json: @item
    else
      render json: { errors: @item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @item = current_user.list.items.find(params[:id])

    if @item.destroy
      render json: {}, status: :no_content
    else
      render json: {}, status: :not_found
    end
  end

  private

  def item_params
    params.require(:item).permit(:subject)
  end

end