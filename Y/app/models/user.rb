class User < ApplicationRecord
    has_many :messages
    has_many :tweets
  end