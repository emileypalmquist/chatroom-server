class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :chatrooms
  def chatrooms
    byebug
    object.chatrooms.order()
  end
end
