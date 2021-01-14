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
  end

  def create
    # orderを作成
    order = Order.new
    order.address=params[:order][:address]


    # order itemを作成
    current_customer.cart_items.each do |ci|
      # order_item = OrderItem.new
      # order_itemitem_id = ci.item_id
      # ...  (ciを元に代入していく)

      # odrde_item.save
    end

    # cart_itemを全て削除...

    # リダイレクトで complete
  end

  def complete
  end

  def index
  end


  def show
  end

  private
  def new_address_params
    params.require(:address).permit(:address)
  end
end
