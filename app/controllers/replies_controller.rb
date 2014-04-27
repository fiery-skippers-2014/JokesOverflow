class RepliesController < ApplicationController
  
  def index
    @replies = Reply.all
  end
  
  def show
    # need test for @joke
    @joke = Joke.find(params[:joke_id])
    @reply = Reply.find(params[:id])
    @all_replies = @joke.replies.all.reverse
  end
  
  def new
    @reply = Reply.new
    @joke = Joke.find(params[:joke_id])
  end

  def create
    joke = Joke.find params[:joke_id]
    @reply = joke.replies.build params[:reply]
    if @reply.save
      redirect_to joke_path(joke)
    else
     render :new
    end
  end

end
