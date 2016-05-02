class CustomersController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @customer = Customer.all
  end

  def new
    @customer = Customer.new 
    @dependents = @customer.dependents.build(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)

      if @customer.save
        flash[:success] = "Customer has successfully been added"
        redirect_to @customer
      else
        flash[:error] = "Unable to add customer"
      end
  end

  def search
    @customers = Customer.search(params[:search])
  end

  private
  def customer_params
    params.require(:customer).permit!
  end

end