

class VotesController < ApplicationController
  def create
    up_vote = params[:up]

    @votes =  Vote.find_vote_count(params[:id], up_vote)

    render :partial => "shared/votescount", local: { votes: @votes }
  end
end
