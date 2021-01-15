class Customers::RegistrationsController < Devise::RegistrationsController
  private

  def account_update_params
    params.require(:customer).permit(:last_name_kana,:last_name,:first_name_kana,:first_name,:address,:postal_code,:telephone_number,:email)
  end
end