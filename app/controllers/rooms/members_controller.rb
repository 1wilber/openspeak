module Rooms
  class MembersController < ApplicationController
    before_action :set_room, only: [ :create ]
    def create
      @room_member = @room.rooms_members.new(user: Current.user)

      if @room_member.save
        redirect_to @room_member.room, notice: "Room member was successfully created."
      else
        redirect_to rooms_path, notice: "Ya te has unido al grupo"
      end
    end

    private

    def set_room
      @room = Room.find(params[:room_id])
    end

    def member_params
      params.require(:rooms_member).permit(:user_id, :room_id)
    end
  end
end
