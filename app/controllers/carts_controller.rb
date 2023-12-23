class CartsController < ApplicationController
  before_action :authenticate_user!

   def index
        @carts = Cart.all
        render json: @carts
      end

  def create
    @cart_item = current_user.carts.build(cart_params)

    if @cart.save
      render json: @cart, status: :created
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cart = current_user.carts.find(params[:id])
    @cart.destroy
    head :no_content
  end

  private

  def cart_params
    params.require(:cart).permit(:food_id, :quantity)
  end
end
