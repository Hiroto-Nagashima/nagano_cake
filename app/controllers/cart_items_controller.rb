class CartItemsController < ApplicationController
  def index
    @cart_items=current_customer.cart_items

  end

  def update
    @cart_item.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    @cart_item.item_id=Item.find(params[:cart_item][:item_id]).id
    @cart_item.update
    redirect_to cart_items_path
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.destroy
  end

  def destroy_all
    @cart_items=current_customer.cart_items
    @cart_items.each do |cart_item|
    cart_item.destroy
    end
    redirect_to cart_items_path


  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    @cart_item.item_id=Item.find(params[:cart_item][:item_id]).id
    if @cart_item.save
      redirect_to cart_items_path
    else
      render item_path
    end
  end
  private
  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end
end
