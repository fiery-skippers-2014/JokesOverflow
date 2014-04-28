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
      p "* " * 30
      p "WE HURRRRR"
      p "* "* 30
      render :partial => 'new_reply', :locals => {:reply => @reply}

    else
     p "/ " * 60
      p @reply
      p "/ " * 60
     render :new
    end
    # render :partial => 'new_reply', :locals => {:reply => @reply}
  end

end
