class OrdersController < ApplicationController
  def index
    before_filter :authenticate_user!
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
  
end
