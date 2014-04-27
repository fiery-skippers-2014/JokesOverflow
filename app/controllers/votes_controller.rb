# class VotesController < ActionController::Base

#   def new
#     @vote = Vote.new
#   end

#   def create
#     if params[:up] == "true"
#       if params[:joke_id] != nil
#         @reply = Reply.find(params[:id])
#         @reply.votes << Vote.create
#       else
#         @joke = Joke.find(params[:id])
#         @joke.votes << Vote.create
#       end
#     else
#       if params[:joke_id] != nil
#         @reply = Reply.find(params[:id])
#         @reply.votes.last.destroy
#       else
#         @joke = Joke.find(params[:id])
#         @joke.votes.last.destroy
#         p @joke.votes
#       end
#     end
#     # render :partial => "shared/votescount", local: {votes: @votes}
#   end

# end

# require 'debugger'

class VotesController < ApplicationController
  def create
    @votes = 0
    p "$ "*30
    p params
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

    render :partial => "shared/votescount", local: {votes: @votes}
  end
end