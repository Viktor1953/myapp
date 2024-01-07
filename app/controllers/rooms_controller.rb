class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
  end
  
  def create
    @room = Room.create(name: params["room"]["name"])
  end

end
