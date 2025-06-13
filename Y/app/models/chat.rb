class Chat < ApplicationRecord
  belongs_to :sender,   class_name: 'User', foreign_key: :sender_id
  belongs_to :receiver, class_name: 'User', foreign_key: :receiver_id

  has_many :messages, dependent: :destroy

  validates :sender_id, :receiver_id, presence: true
  validate  :sender_and_receiver_different


  scope :inbox, ->(user) { where("sender_id = :id OR receiver_id = :id", id: user.id) }


  def other_participant(user)
    user.id == sender_id ? receiver : sender
  end

  private

  def sender_and_receiver_different
    errors.add(:receiver_id, 'no puede ser igual al remitente') if sender_id == receiver_id
  end
end