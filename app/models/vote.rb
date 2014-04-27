class Vote < ActiveRecord::Base
  belongs_to :votable, :polymorphic => true

  def self.find_vote_count(id, is_up_vote)

    @joke = Joke.find(id)
    if is_up_vote == "true"
      self.up_vote @joke
    else
      self.down_vote @joke
    end
    @joke.votes.length
  end

  private

  def self.up_vote(joke)
    joke.votes << Vote.create
  end

  def self.down_vote(joke)
    joke.votes.last.try(:destroy)
  end

end
