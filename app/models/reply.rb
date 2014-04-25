class Reply < ActiveRecord::Base
  belongs_to :joke
  attr_accessible :content
end