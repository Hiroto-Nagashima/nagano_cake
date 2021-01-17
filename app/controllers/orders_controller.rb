class OrdersController < ApplicationController
  def new
    @orders=Order.all
    @order=Order.new
    @customer=current_customer
  end

  def confirm
      @order=Order.new
      @order.shopping_fee = 800
   current_customer.cart_items.each do |ci|
      @order.total_price= ci.amount*ci.item.price + @order.shopping_fee
   end
    @order.payment_method=params[:order][:payment_method]
    @customer=current_customer
    if params[:order][:selected_address]== "0"
        @order.address=@customer.address
        @order.name=@customer.last_name + @customer.first_name
        @order.postal_code=@customer.postal_code
    elsif params[:order][:selected_address]== "1"
      address=Address.find(params[:order][:registered_address])
      @order.address=address.address
    else
      @order.address=params[:order][:address]
      @order.name=params[:order][:name]
      @order.postal_code=params[:order][:postal_code]
    end

    # render :new if @order.invalid?
  end

  def create
    order = Order.new
    order.customer_id=current_customer.id
    order.postal_code=params[:order][:postal_code]
    order.address=params[:order][:address]
    order.name=params[:order][:name]
    order.shopping_fee = 800
    order.total_price=params[:order][:total_price]
    if order.save
      current_customer.cart_items.each do |ci|
        order_item = OrderItem.new
        order_item.item_id = ci.item_id
        order_item.price=ci.item.price
        order_item.amount=ci.amount
        order_item.order_id= order.id
        order_item.save
      end
        cart_items=current_customer.cart_items
        cart_items.destroy_all
        redirect_to orders_complete_path
    else
      render "confirm"
    end

  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end


  def show
  end

  private
  def new_address_params
    params.require(:address).permit(:address)
  end
end
