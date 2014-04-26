class VotesController < ApplicationController
  def index
    'hi'
  end

  def create
    p params
    @votes = 0
    if params[:up] == "true"
      if params[:joke_id] != nil
        @reply = Reply.find(params[:id])
        @reply.votes << Vote.create
      else
        @joke = Joke.find(params[:id])
        @joke.votes << Vote.create
        @votes = @joke.votes.length
      end
    else
      if params[:joke_id] != nil
        @reply = Reply.find(params[:id])
        @reply.votes.last.destroy
      else
        @joke = Joke.find(params[:id])
        @joke.votes.last.destroy
         @votes = @joke.votes.length
      end
    end
    # p @votes
    render :partial => "shared/votescount", local: {votes: @votes, id: params[:id]}
  end
  'helo'
end