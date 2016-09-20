class VisitorsController < ApplicationController
before_action :set_theme, only: [:show]

  def new
    @visitor = Visitor.new
    @themes = Theme.all
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:visitor).permit(:email)
  end



end
