class RoomsController < ApplicationController
  def index
    @current_user = current_user # oK
    redirect_to '/signin' unless @current_user # oK
    @rooms = Room.public_rooms # oK
    @users = User.all_except(@current_user) # oK
    @room = Room.new
  end

  def create
    @room = Room.create(name: params["room"]["name"])
    
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    
    


    @message = Message.new
    @messages = @single_room.messages


    
    render "index"
  end

end
