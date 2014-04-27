
class VotesController < ApplicationController
  def create
    flash.clear
    cookies[params[:id]] ||= { value: false, expires: 10.minutes.from_now }
    unless cookies[params[:id]]
      up_vote = params[:up]
      cookies[params[:id]] = { value: true, expires: 10.minutes.from_now }
      @votes =  Vote.find_vote_count(params[:id], up_vote)
    else
      flash[:notice] = "You cannot Vote Again"
      @votes =  Joke.find(params[:id]).votes.length
    end
    render :partial => "shared/votescount", local: { votes: @votes }
  end
end

# class VotesController < ApplicationController
#   def create
#     cookies[params[:id]] ||= false
#     unless cookies[params[:id]]
#       up_vote = params[:up]
#       cookies[params[:id]] = true
#       @votes =  Vote.find_vote_count(params[:id], up_vote)
#     else
#       flash[:notice] = "You cannot Vote Again"
#       @votes =  Joke.find(params[:id]).votes.length
#     end
#     render :partial => "shared/votescount", local: { votes: @votes }
#   end
# end
