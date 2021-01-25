class Admin::OrderDetailsController < ApplicationController
  def update
    @order_item=OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(status: params[:order_item][:status])
     @order.order_items.each do |order_item|
        if order_item.status == "製作中"
           @order.update(status: "製作中")
        end

        if @order.order_items.count == @order.order_items.where(status:"製作完了").count
          @order.update(status: "発送準備中")
        end
     end
  redirect_to admin_order_path(@order_item.order.id)
  end
end
