class CustomersController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    if params[:search]
      @customers = Customer.search(params[:search])
    end
  end

  def new
    @customer = Customer.new
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render 'edit'
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customers = Customer.new(customer_params)
    @customers.save
    redirect_to @customers
  end

   private
  def customer_params
    params.require(:customer).permit!
  end


end