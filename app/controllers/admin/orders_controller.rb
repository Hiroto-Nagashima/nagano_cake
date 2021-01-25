class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @customer = @order.customer
  end
  def index
    @orders=Order.all
  end
  def individual
    @customer = Customer.find(params[:id])
    @orders=@customer.orders
    render :index
  end

  def update
     @order=Order.find(params[:id])
     @order.update(status: params[:order][:status])
     if @order.status == "入金確認"
       @order.order_items.each do |order_item|
       order_item.status = "製作待ち"
       order_item.update
       end
       redirect_to admin_order_path
     else
       render "show"
     end
  end
  private
  def order_params
    params.require(:order).permit(:status)
  end
end

