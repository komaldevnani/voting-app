class PollsController < ApplicationController
  before_action :set_poll, only:[:show,:edit,:update, :destroy]

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.user = current_user
    if @poll.save
      flash[:notice] = "Poll was created!"
      redirect_to polls_path
    else
      render 'new'
    end
  end

  def index
    @polls = Poll.includes(:items).paginate(page: params[:page], per_page: 5)
    @vote = Vote.new
  end

  def show
    @poll = Poll.includes(:items).find_by_id(params[:id])
    @vote = Vote.new
  end

  def edit
  end

  def update
    if @poll.update_attributes(poll_params)
      flash[:notice] = 'Poll was updated!'
      redirect_to polls_path
    else
      render 'edit'
    end
  end

  def user_polls
    @polls = current_user.polls.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    if @poll.destroy
      flash[:notice] = 'Poll was destroyed!'
    else
      flash[:alert] = 'Error destroying poll...'
    end
    redirect_to polls_path
  end

  private

  def set_poll
    @poll = Poll.find_by_id(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:title, items_attributes: [:id,:name, :_destroy])
  end
end
