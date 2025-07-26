class RoomDecorator < Draper::Decorator
  delegate_all

  def join_or_show_link
    already_joined = Current.user.rooms.include?(self)
    path = already_joined ? room : h.room_members_path(room.id)
    label = already_joined ? I18n.t("rooms.actions.show") : I18n.t("rooms.actions.join")
    method = already_joined ? :get : :post

    h.link_to(label, path, class: "secondary", data: { turbo_method: method }, role: :button)
  end
end
