class PollsController < ApplicationController
  before_action :set_poll, only:[:show,edit,:update, :destroy]

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
    @polls = Poll.all
  end

  def edit
  end

  def update

  end

  private

  def set_poll
    @poll = Poll.find_by_id(params[:id])
  end

  def poll_params
    params.require(:poll).permit(:title)
  end
end
