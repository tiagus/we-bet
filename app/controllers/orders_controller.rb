class OrdersController < ApplicationController
  def create
    bet = Bet.find(params[:bet_id])
    order  = Order.create!(bet: bet, amount: bet.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Ticket: #{bet.numbers.join(' - ')} #{bet.stars.join(' - ')}",
        amount: bet.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: thankyou_url,
      cancel_url: dashboard_url
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @draws = Draw.all
  end
end
