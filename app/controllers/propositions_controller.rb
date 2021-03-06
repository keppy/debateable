class PropositionsController < ApplicationController
#  before_filter :signed_in_user
#  before_filter :correct_user, only: :destroy

  def index
    @propositions = Proposition.paginate(page: params[:page])
    if !signed_in?
      flash[:alert] = "You may browse current debates, but you should sign up to start debating!"
    end
  end

  def debateable_propositions
    @propositions = Proposition.debateable_by(current_user)
  end

  def show
    @proposition = Proposition.find(params[:id])
    if !signed_in?
      flash[:alert] = "Sign Up or Sign In to oppose this proposition."
    end
  end

  def new
    @proposition = current_user.propositions.new(params[:proposition])
  end

  def create
    @user = current_user
    @proposition = current_user.propositions.create(params[:proposition])
    if @proposition.save 
      flash[:success] = "Proposition saved!"
      redirect_to @user
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
