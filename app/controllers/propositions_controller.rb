class PropositionsController < ApplicationController

  def new
    @proposition = Proposition.new
    @user = @proposition.user
  end

  def create
    @proposition = Proposition.new(params[:proposition])
    if @proposition.save
      flash[:success] = "Proposition saved!"
      redirect_to @proposition
    else
      render 'new'
    end
  end
end
