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
    p "% "*30
    p joke
    p params
    @reply = joke.replies.build params[:reply]
    p @reply
    if @reply.save!
      p "SAVED"
      p @reply
      redirect_to new_joke_reply_path(joke, @reply)
    else
      p "DIDNT SAVE"
    end
  end
  # def edit
  # end
  # def update
  # end
  # def destroy
  # end
end
