require 'spec_helper'

describe Reply do
  context "validations" do

    it { should validate_presence_of :content}
    # this is a duplicate of line 6.
    it "content must be present" do
      expect {
        joke = Joke.new
        joke.save
    }.not_to change { Joke.count }
    end
  end

  context "associations" do
    it { should belong_to :joke }
  end

end
