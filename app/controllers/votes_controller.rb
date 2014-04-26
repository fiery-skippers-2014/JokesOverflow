require 'debugger'

class VotesController < ApplicationController
  def create
    @votes = 0
    if session[:joke_array] == nil
      session[:reply_array] = []
      session[:joke_array] = []
    end

    # Move this to a model, checks for sessions, only one vote allowed
    if params[:joke_id]
      if session[:reply_array].include?(params[:id])
        redirect_to jokes_path
      else
        session[:reply_array] << params[:id]
      end
    elsif params[:id]
      if session[:joke_array].include?(params[:id])
        redirect_to replies_path
      else
        session[:joke_array] << params[:id]
      end
    end

    #Creates a new vote
    if params[:up] == "true"
      if params[:joke_id] != nil
        @reply = Reply.find(params[:id])
        @reply.votes << Vote.create
        @votes = @reply.votes.length
      else
        @joke = Joke.find(params[:id])
        @joke.votes << Vote.create
        @votes = @joke.votes.length
      end
    else
      if params[:joke_id] != nil
        @reply = Reply.find(params[:id])
        @reply.votes.last.destroy
        @votes = @reply.votes.length
      else
        @joke = Joke.find(params[:id])
        @joke.votes.last.destroy
         @votes = @joke.votes.length
      end
    end
    render :partial => "shared/votescount", local: {votes: @votes}
  end
end
