class ItemsController < ApplicationController
  def index
      @items = Item.search_for(params[:q])
  end

  def new
  end

  def create
  end

  def show
  end

  def safe_items_params
  end
end
