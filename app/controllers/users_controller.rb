class UsersController < ApplicationController
  def show
  	@user = current_user
  	@item = Item.new()
  end
end
