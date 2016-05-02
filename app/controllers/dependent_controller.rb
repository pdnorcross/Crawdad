class DependentController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @dependent = Dependent.all
  end

  def new
    @dependent = Dependent.new 
  end

  def show
    @dependent = Dependent.find(params[:id])
  end

  def create
    @dependent = Dependent.new(dependent_params)
  end

  def search
    @customers = Dependent.search(params[:search])
  end

  private
  def dependent_params
    params.require(:dependent).permit!
  end
end