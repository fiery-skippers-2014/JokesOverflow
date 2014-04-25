class VotesController < ActionController::Base

  def new
    @vote = Vote.new
  end

  def create
     p params
    if params[:joke_id] != nil
      @reply = Reply.find(params[:id])
      @reply.votes << Vote.create
    else
      @joke = Joke.find(params[:id])
      @joke.votes << Vote.create
    end
   redirect_to jokes_path
  end
end