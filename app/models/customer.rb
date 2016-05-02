class Customer < ActiveRecord::Base

has_many :dependents
accepts_nested_attributes_for :dependents

#this is not right
#validates_numericality_of :last_4, :on => :create,
#  :greater_than_or_equal_to => 2,
#  :message => "This customer has exceeded their monthly limit."

<<<<<<< HEAD
def validateCustomer  
  customer = Customer.where(
    created_at: Time.now.beginning_of_month..Time.now.end_of_month,
    address: self.address,
    last_4: self.last_4)
  if customer.length > 2
    return false
  end
end
=======
#validates_presence_of :address, :on => :create,
#  :presence => true

  sql = "select if(count(*)>2)
           from customers 
           where last_4 = '8674'
           or
           address = '1111 Main Street'"
>>>>>>> f02aed02635f84d285d059d3da6aea16727d3193


  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def submit
  	redirect_to "customers/show"
  end
end