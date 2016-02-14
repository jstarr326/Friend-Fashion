class ItemsController < ApplicationController

  def index
    #[1, 2]
      friends_list = current_user.user_friends
      @items = Item.friends_items(friends_list)
      #Item.exclude(current_user)
      #Item.search_for(params[:q])
  end

  def new
    @items = current_user.items
    @item = Item.new()
  end

  def create
    @item = Item.new(safe_item_params)
    @item.user = current_user
    if @item.save()
      flash[:success] = "Item successfully saved!"
      redirect_to new_item_path
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
