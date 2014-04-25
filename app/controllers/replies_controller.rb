class RepliesController < ActionController::Base
  def index
    @replies = Reply.all
  end
  def show
    @reply = Reply.find(params[:id])
  end
  def new
    @reply = Reply.new
  end

  def create
    joke = Joke.find params[:joke_id]
    @reply = joke.replies.build params[:reply]
    p @reply.valid?
    if @reply.save
      redirect_to new_joke_reply_path(joke, @reply)
    else
     render :new
    end
  end
  # def edit
  # end
  # def update
  # end
  # def destroy
  # end
end
