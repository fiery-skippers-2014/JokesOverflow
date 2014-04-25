class VotesController < ActionController::Base

  def new
    @vote = Vote.new
  end

  def create
    if params[:up] == "true"
      if params[:joke_id] != nil
        @reply = Reply.find(params[:id])
        @reply.votes << Vote.create
      else
        @joke = Joke.find(params[:id])
        @joke.votes << Vote.create
      end
    else
      if params[:joke_id] != nil
        @reply = Reply.find(params[:id])
        @reply.votes.last.destroy
      else
        @joke = Joke.find(params[:id])
        @joke.votes.last.destroy
        p @joke.votes
      end
    end
    redirect_to jokes_path
  end

end