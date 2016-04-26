class CustomersController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    if params[:search]
      @customer = Customer.search(params[:search])
    end
  end

  def new
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to @customer
  end

   private
  def customer_params
    params.require(:customer).permit!
  end


end