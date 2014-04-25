class JokesController < ActionController::Base
  def index
    @jokes = Joke.all
  end


  def show
    @joke = Joke.find(params[:id])
  end

  # def new
  #   @joke = Joke.new
  # end

  # def create
  #   @joke = Joke.new params[:joke]
  #   if @joke.save
  #     redirect_to jokes_path
  #   else
  #     render new_joke_path
  #   end
  # end

  # def edit
  #    @joke = Joke.find(params[:id])
  # end

  # def update
  # end

  # def destroy
  # end

end
