class Post < ApplicationRecord
  has_many :comments
  
  has_many :votes
  has_many :voters, through: :votes, source: "user"
  
  validates :title, :body, presence: true
end
