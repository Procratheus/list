class Api::ItemsController < ApiController
  before_action :authenticated?

  def index
    @items = Item.all
    render json: @item
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)

    if @item.save
      render json: @item
    else
      render json: { errors: @item.errors.full_messages }
    end
  end

  private

  def item_params
    params.require(:item).permit(:subject)
  end

end