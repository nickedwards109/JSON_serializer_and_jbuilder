class Api::V1::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    render json: Order.find(params[:id])
  end
end
