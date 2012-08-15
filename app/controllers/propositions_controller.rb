class PropositionsController < ApplicationController
#  before_filter :signed_in_user
#  before_filter :correct_user, only: :destroy

  def index
  end

  def new
    @proposition = current_user.propositions.new
  end

  def create
    @proposition = current_user.propositions.create(params[:proposition])
    if @proposition.save 
      flash[:success] = "Proposition saved!"
    else
      flash[:error] = "Proposition not saved."
    end
  end

  private
    def correct_user
      @proposition = current_user.propositions.find_by_id(params[:id])
      redirect_to root_path if @proposition.nil
    end
end
