class CreditsController < ApplicationController
  protect_from_forgery :except => [:create]
  def pay
    debugger
    api_key = 'sk_test_62d28643ef7c90e1139a9815'
    Payjp.api_key = api_key
    Payjp::Charge.create(
      :amount => 3500,
      :card => params['payjp-token'],
      :currency => 'jpy',
    )
  end

  def create
    @credit = Credit.new(params)
    binding.pry
    if @credit.save
      format.html
      format.json
    else
      console.log("controllerでエラーです");
  end
  private

  def credit_params
    params.require(:credit).permit(:name, :email)
  end

end
