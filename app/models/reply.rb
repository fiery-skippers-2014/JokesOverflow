class Reply < ActiveRecord::Base
  belongs_to :joke
  attr_accessible :content
  validates :content, presence: true
end
