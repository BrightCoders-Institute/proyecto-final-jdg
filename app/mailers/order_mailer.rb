class OrderMailer < ApplicationMailer
  def order_mail(order)
    @order = order
    mail(to: @order.user.email, subject: 'You have a new order')
  end

  def processing_order_mail(order)
    @order = order
    mail(to: @order.user.email, subject: 'Your order has been accepted and is in progress')
  end

  def cancelled_order_mail(order)
    @order = order
    mail(to: @order.user.email, subject: 'Your order cannot be completed')
  end

  def completed_order_mail(order)
    @order = order
    mail(to: @order.user.email, subject: 'Your order has been delivered')
  end
end
