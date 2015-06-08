module UsersHelper
  def action_buttons(user)
    case current_user.friendship_status(user) when "friends"
      link_to "Destroy Friendship", friendship_path(current_user.friendship_relation(user)), method: :delete, class: "btn btn-danger"
    when "pending"
      link_to "Cancel Friendship", friendship_path(current_user.friendship_relation(user)), method: :delete, class: "btn btn-normal"
    when "requested"
      link_to "Accept", accept_friendship_path(current_user.friendship_relation(user)), method: :put, class: "btn btn-info"
    when "not_friends"
      link_to "Add Friendship", friendships_path(user_id: user.id), method: :post, class: "btn btn-primary"
    end
  end
end