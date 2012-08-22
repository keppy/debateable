class PropositionsController < ApplicationController
#  before_filter :signed_in_user
#  before_filter :correct_user, only: :destroy

  def index
    @propositions = Proposition.paginate(page: params[:page])
    if !signed_in?
      flash[:alert] = "You may browse current debates, but you should sign up to start debating!"
    end
  end

  def debateable_proposition_index
    propositions = Proposition.scoped.table
    @propositions = posts.where(params[:user_id].eq(current_user).not).to_sql
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
