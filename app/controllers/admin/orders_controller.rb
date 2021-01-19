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
     if @order.update(status: params[:order][:status])
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

