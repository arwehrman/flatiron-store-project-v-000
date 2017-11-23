def checkout
  @cart = Cart.find(params[:id])
  @cart.checkout
  current_user.remove_current_cart
  redirect_to cart_path(@cart)
end

def checkout
  self.status = "submitted"
  self.line_items.each do |line_item|
    line_item.item.inventory = line_item.item.inventory - line_item.quantity
    line_item.item.save
  end
end
