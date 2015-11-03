class SupportsController < ApplicationController

  def index
    @support = Support.new
  end

  def new
    @supports = Support.order("id DESC").all
  end

  def create
    @supports = Support.all
    @support = Support.new(params.require(:support).permit([:name, :email, :department, :message ]))
    if @support.save
      flash[:notice] = "Request created successfully"
      #render :new
      redirect_to new_support_path
    else
      flash[:alert] = "Error"
      render :index
    end
  end

  def edit
    @support = Support.find(params[:id])
  end

  def update
    @support = Support.find(params[:id])
    @supports = Support.all
    if @support.update(params.require(:support).permit([:name, :email, :department, :message ]))
      flash[:notice] = "Request edited successfully"
      redirect_to new_support_path
    else
      flash[:alert] = "Name and Email required"
      render :edit
    end
  end

  def destroy
    @support = Support.find(params[:id])
    @supports = Support.all
    @support.destroy
    flash[:notice] = "Request deleted successfully"
    render :new
  end

end
