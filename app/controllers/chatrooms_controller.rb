class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom).all
  end

  def show
    @chatrooms = policy_scope(Chatroom).all
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    authorize @chatroom
    if @chatroom.save
      redirect_to chatrooms_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
