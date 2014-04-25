class Joke < ActiveRecord::Base
  attr_accessible :title
  has_many :replies
end