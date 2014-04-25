class JokesController < ActionController::Base
  def index
    # @jokes = Jokes.all
  end
  def new
    @joke = Joke.new
  end
  def show

  end

  def create
    # @joke = Joke.new
    # if @joke.save
    #   redirect :jokes_path
    # else
    #   redirect :jokes_new_path
    # end
  end

  def edit
  end
  def update
  end
  def destroy
  end
end
