class LineItemsController < ApplicationController
  def create
    if current_user
      if current_user.current_cart.nil?
        current_cart = Cart.create(user_id: current_user.id)
        current_user.current_cart_id = current_cart.id
        current_user.save
      end
      current_cart = current_user.current_cart

      current_cart.add_item(params[:item_id]).save
      redirect_to cart_path(current_cart.id)
    else
      redirect_to '/'
    end
  end
end
