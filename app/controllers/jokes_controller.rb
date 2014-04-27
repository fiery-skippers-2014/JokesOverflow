class JokesController < ApplicationController
  def index
    if params[:sort_time]
      @jokes = Joke.all.reverse
    else
      @jokes = Joke.all
      @jokes.sort_by! do |joke|
        joke.votes.length
      end.reverse!
    end
    @vote = Vote.new
  end

  def show
    @joke = Joke.find(params[:id])
    if params[:sort_time]
      @all_replies = @joke.replies.all.reverse
    else
    @all_replies = @joke.replies.all
      @all_replies.sort_by! do |reply|
          reply.votes.length
      end.reverse!
    end
    @vote = Vote.new
  end

  def new
    @joke = Joke.new
  end

  def create
    @joke = Joke.new params[:joke]
    if @joke.save
      redirect_to jokes_path
    else
      render new_joke_path
    end
  end
end
