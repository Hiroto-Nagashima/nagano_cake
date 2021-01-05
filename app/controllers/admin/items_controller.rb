class Admin::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page]).reverse_order
    if genre_id ==1
      @genre = "ケーキ"
    else if genre_id ==2
      @genre = "プリン"
    else if genre_id ==3
      @genre = "焼き菓子"
    else @genre = "キャンディ"
    end
        
  end

  def new
    @item=Item.new
  end

  def show
    @item=Item.find(params.id)
  end

  def edit
  end

  def create
    @item=Item.new(item_params)
   if @item.save
    redirect_to admin_items_index_path
   else
    render "new"
   end
  end

  def update
  end

private
def item_params
  params.require(:item).permit(:name, :image, :introduction,:genre_id,:price,:is_active)
end
end
