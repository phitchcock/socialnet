class User < ActiveRecord::Base
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #validates :username, presence: true
  #validates :username, uniqueness: true

  def request_friendship(user_2)
    self.friendships.create(friend: user_2)
  end

  def active_friends
    self.friendships.map(&:friend) + self.inverse_friendships.map(&:user)
  end

  def pending_friend_requests_to
    self.friendships.where(state: "pending")
  end

  def pending_friend_requests_from
    self.inverse_friendships.where(state: "pending")
  end

  def friendship_status(user_2)
    friendship = Friendship.where(user_id: [self.id,user_2.id], friend_id: [self.id,user_2.id])
    unless friendship.any?
      return "not_friends"
    else
      if friendship.first.state == "active"
        return "friends"
      else
        if friendship.first.user == self
          return "pending"
        else
          return "requested"
        end
      end
    end
  end

  def friendship_relation(user_2)
    friendship = Friendship.where(user_id: [self.id,user_2.id], friend_id: [self.id,user_2.id]).first
  end
  
end
