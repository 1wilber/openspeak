class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  def index
    @rooms = RoomDecorator.decorate_collection(
      Room.all.includes(:rooms_members)
    )
  end


  def show
  end

  def new
    @room = Current.user.owned_rooms.new
  end

  def edit
  end

  def create
    @room = Current.user.owned_rooms.new(room_params)

    if @room.save
      redirect_to @room, notice: "Room was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: "Room was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy!
    redirect_to rooms_path, notice: "Room was successfully destroyed.", status: :see_other
  end

  private
    def set_room
      @room = Room.find(params.expect(:id))
    end

    def room_params
      params.expect(room: [ :name, :user_id ])
    end
end
