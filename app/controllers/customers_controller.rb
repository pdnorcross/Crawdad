class CustomersController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
    @customer = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
@customer = Customer.new(customer_params)
    

# @customer = Customer.new(params[:customer])
  
  
#   if @customer.validate_record 
#     render action: "new"
#     flash[:error] = "Unable to add customer"
#     #redirect_to root_path, notice: 'Your customer is being processed.'
#   else
#     #@customer = @customer.save
#     # render action: "customers/show"
#     flash[:success] = "Customer has successfully been added"
#     render action: "show"
#     #redirect_to @customer
#   end



  #  @customer.save
  #    redirect_to @customer

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