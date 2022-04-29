class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  def index
    @orders = Order.completed.by_creation_date_desc
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit; end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:success] = "Welcome to the App!"
      redirect_to order_url(@order)
    else
      render 'new'
    end
  end

  def update
    if @order.update(order_params)
      redirect_to order_url(@order), notice: "Order was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Order was successfully destroyed."
  end
end

private
  def set_order
    @order ||= Order.find(params.permit(:id)[:id].to_i)
  end

  def order_params
    params.require(:order).permit(:amount, :completed )
  end