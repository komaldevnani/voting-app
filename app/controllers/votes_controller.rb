class VotesController < ApplicationController
  def create
    if current_user && params[:poll] && params[:poll][:id] && params[:item] && params[:item][:id]
      @poll = Poll.find_by_id(params[:poll][:id])
      @option = @poll.items.find_by_id(params[:item][:id])
      if @option && @poll && !current_user.voted_for?(@poll) && @poll.votes_count <12
        current_user.votes.create({item_id: @option.id})
        flash[:notice] = "Successfully voted! "
      else
        flash[:alert] = "Your vote cannot be saved. Have you already voted?"
      end
    else
      flash[:alert] = "Your vote cannot be saved."
    end
  end
end