require 'spec_helper'

describe Joke do
 it {should have_many :replies}
 it {should validate_presence_of :title}
 it {should validate_uniqueness_of :title}
end

