class JokesController < ApplicationController
  def index
    @jokes = Joke.all
    @vote = Vote.new
  end

  def show
    @joke = Joke.find(params[:id])
    @all_replies = @joke.replies.all.reverse
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

  # def edit
  #    @joke = Joke.find(params[:id])
  # end

  # def update
  # end

  # def destroy
  # end

end
