class ItemsController < ApplicationController
  def index
      @items = Item.search_for(params[:q])
  end

  def new
    @items = item.new()
  end

  def create
    @item = Item.new(safe_item_params)
    if @item.save()
      redirect_to @item
    else
      render 'new'
    end
  end

    def update
    if @item.update(safe_item_params)
        #if the shirt was successfully saved, redirect to the show shirt page
      redirect_to @item
    else
        #if the shirt wasn't successfully saved, render the "new.html" view (allow user to edit it and try saving again)
      render 'edit'
    end
    end

  def show
  end

  def safe_item_params
    params.require('item').permit(:name, :description, :category, :size)
  end
end
