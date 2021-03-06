class CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show

  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(edit_params)
    redirect_to customers_my_page_path
  end

  def unsubscribe
  end
  def withdraw
     @customer = Customer.find(current_customer.id)
     @customer.update(is_active: "退会")
     reset_session
     redirect_to root_path
  end

  private
  def edit_params
    params.require(:customer).permit(:last_name_kana,:last_name,:first_name_kana,:first_name,:address,:postal_code,:telephone_number,:email)
  end
end
