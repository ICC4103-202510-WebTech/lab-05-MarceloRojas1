class Chat < ApplicationRecord
  belongs_to :sender,
             class_name: 'User',
             foreign_key: :sender_id
  belongs_to :receiver,
             class_name: 'User',
             foreign_key: :receiver_id

  has_many :messages,
           dependent: :destroy

  validates :sender_id, :receiver_id, presence: true
  validate  :sender_and_receiver_different

  private

  def sender_and_receiver_different
    errors.add(:receiver_id, 'error') if sender_id == receiver_id
  end
end
