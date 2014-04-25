class RepliesController < ActionController::Base
  def index
    @replies = Reply.all
  end
  # def new
  #   @reply = Reply.new
  # end
  def show
    @reply = Reply.find(params[:id])
  end
  # def create
  # end
  # def edit
  # end
  # def update
  # end
  # def destroy
  # end
end
