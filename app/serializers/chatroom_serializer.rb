class ChatroomSerializer < ActiveModel::Serializer
    attributes :id, :name, :messages
    has_many :users
    
    def messages
      object.messages.reverse_order
    end
  end