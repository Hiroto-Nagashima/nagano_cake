class OrdersController < ApplicationController
  def new
    @orders=Order.all
    @order=Order.new
    @customer=current_customer

    if params[:selected_address]=="self_address"
        @order.address=@customer.address
    elsif params[:selected_address]=="selected_address"
      @order.address=Address.find(params[:address])
    else
      @address=Address.new(new_address_params)
      @order.address=@address
    end
  end

  def confirm
  end

  def complete
  end

  def create
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
