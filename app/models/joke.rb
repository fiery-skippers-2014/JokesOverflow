class Joke < ActiveRecord::Base
  attr_accessible :title
  has_many :replies
  validates :title, presence: true, uniqueness: true
end
