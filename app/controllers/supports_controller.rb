class SupportsController < ApplicationController

  def index
    @support = Support.new
    @supports = Support.order("id DESC").all
  end

  def new
    @support = Support.new
  end

  def create
    @support = Support.new(params.require(:support).permit([:name, :email, :department, :message ]))
    if @support.save
      flash[:notice] = "Request created successfully"
      redirect_to root_path
    else
      render :index
      flash[:alert] = "Error"
    end
  end

  def show
    @support = Support.find params[:id]
    @supports = Support.all
  end

  def edit
    @support = Support.find params[:id]
  end

  def update
    @support = Support.find(params[:id])
    if @support.update(params.require(:support).permit([:name, :email, :department, :message ]))
      flash[:notice] = "Request edited successfully"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @support = Support.find(params[:id])
    @support.destroy
    flash[:notice] = "Request deleted successfully"
    redirect_to root_path
  end

  def done
    @support = Support.find(params[:id])

  end

end
