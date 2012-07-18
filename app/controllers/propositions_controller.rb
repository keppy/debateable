class PropositionsController < ApplicationController
#  before_filter :signed_in_user
#  before_filter :correct_user, only: :destroy

 def index
 end

  def new
    @proposition = current_user.propositions.new
  end

  def create
    @proposition = current_user.propositions.build(params[:proposition])
    if @proposition.save 
      flash[:success] = "Proposition saved!"
    else
      flash[:error] = "Proposition not saved."
    end
  end

  private
    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil
    end
end
