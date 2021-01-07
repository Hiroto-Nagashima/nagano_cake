class Admin::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page])

  end

  def new
    @item=Item.new
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def create
    @item=Item.new(item_params)
   if @item.save
    redirect_to admin_items_path
   else
    render new_admin_item_path
   end
  end

  def update
    @item=Item.find(params[:id])
   if @item.update(item_params)
    redirect_to admin_item_path
   else
    render edit_admin_item_path
   end
  end

private
  def item_params
    params.require(:item).permit(:name,:image,:introduction,:genre_id,:price,:is_active)
  end
end
