class CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @items = Item.all
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end
  def withdraw
  end
end
