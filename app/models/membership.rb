class Membership < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :user_id, uniqueness: { scope: :chatroom_id, message: "This user is already in the chat."}
end
