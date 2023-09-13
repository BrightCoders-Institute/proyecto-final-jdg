class OrderMailer < ApplicationMailer
  def new_order_mail(order)
    @order = order
    mail(to: 'cruzhugo1997@gmail.com', subject: "You have a new order")
  end
end
