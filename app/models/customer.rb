class Customer < ActiveRecord::Base

has_many :dependent 
accepts_nested_attributes_for :dependent

#this is not right
#validates_numericality_of :last_4, :on => :create,
#  :greater_than_or_equal_to => 2,
#  :message => "This customer has exceeded their monthly limit."

#validates_presence_of :address, :on => :create,
#  :presence => true

  sql = "select if(count(*)>2)
           from customers 
           where last_4 = '8674'
           or
           address = '1111 Main Street'"


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