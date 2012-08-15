class DebatesController < ApplicationController

  def index
  end

  def new
    @debate = current_user.government_debate.new
  end

  def create
    @debate = current_user.government_debate.build(params[:user])
    if @debate.save
    flash[:success] = "Debate created!"
    else
    flash[:error] = "Debate not created."
    end
  end

end
