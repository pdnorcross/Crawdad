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
    @dependents = @customer.dependents.build(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    @dependents = @customer.dependents.build(params[:id])
  end

  def create
    @customers = Customer.new(customer_params)
    @customers.save
    redirect_to @customers
  end

  def update
    @customers = Customer.find(params[:id])
    if @customers.update(customer_params)
      redirect_to @customers
    else
      render 'show'
    end
  end

   private
  def customer_params
    params.require(:customer).permit!
  end


end