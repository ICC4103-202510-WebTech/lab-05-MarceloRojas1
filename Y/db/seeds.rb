# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
users = 10.times.map do |i|
    User.create!(
      email: "user#{i}@example.com",
      first_name: "Nombre#{i}",
      last_name: "Apellido#{i}"
    )
  end
  
  chats = 10.times.map do
    sender, receiver = users.sample(2)
    Chat.create!(
      sender_id: sender.id,
      receiver_id: receiver.id
    )
  end
  
  10.times do |i|
    chat = chats.sample
    user = users.sample
    Message.create!(
      chat_id: chat.id,
      user_id: user.id,
      body: "mensaje n #{i}"
    )
  end
