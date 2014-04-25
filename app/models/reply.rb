class Reply < ActiveRecord::Base
  attr_accessible :content
  validates :content, presence: true
  belongs_to :joke
  has_many :votes, :as => :votable
end



