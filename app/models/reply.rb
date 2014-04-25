class Reply < ActiveRecord::Base
  attr_accessible :content
  belongs_to :joke
  has_many :votes, :as => :votable
end