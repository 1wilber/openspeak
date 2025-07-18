module RoomsHelper
  def room_join_or_show_link(room)
    already_joined = Current.user.rooms.include?(room)
    path = already_joined ? room : room_members_path(room.id)
    label = already_joined ? 'Show' : 'Join'
    method = already_joined ? :get : :post

    link_to(label, path, class: "button primary", data:{turbo_method: method})
  end
end
