class Joke < ActiveRecord::Base
  attr_accessible :title
  has_many :replies
  has_many :votes, :as => :votable
  validates :title, presence: true, uniqueness: true
end
