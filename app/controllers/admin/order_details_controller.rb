class Admin::OrderDetailsController < ApplicationController
  def update
    @order_item=OrderItem.find(params[:id])
     if @order_item.update(status: params[:order_item][:status])
       redirect_to admin_order_path
     else
       render "show"
     end
  end
end
