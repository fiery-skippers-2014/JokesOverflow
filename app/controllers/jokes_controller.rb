class JokesController < ActionController::Base
  def index
    @jokes = Joke.all
  end

  def new
    #
    @joke = Joke.new
  end

  def show
    @joke = Joke.find(params[:id])
  end

  def create
    @joke = Joke.new
    respond_to do |format|
      if valid
        format.json { render :json => jokes_path }
      else
        format.json { render :json => @object.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
     @joke = Joke.find(params[:id])
  end

  def update
    respond_to do |format|
      if valid
        format.json { render :json => jokes_path }
      else
        format.json { render :json => @object.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
  end

end
