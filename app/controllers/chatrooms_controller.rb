class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
end
