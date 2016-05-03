class Customer < ActiveRecord::Base

has_many :dependents
accepts_nested_attributes_for :dependents

before_create :validate_record

def validateCustomer  
  customer = Customer.where(
    created_at: Time.now.beginning_of_month..Time.now.end_of_month,
    address: self.address,
    last_4: self.last_4)
  if customer.length > 2
    return false
  end
end

  def validate_record
    if validateCustomer
      errors.add(:customer, "This customer has exceeded their monthly limit.")
    end
  end

def self.search(search)
  where("last_4 LIKE ?", "%#{search}%")
  where("fname LIKE ?", "%#{search}%")
end

  def submit
    redirect_to "customers/show"
  end
end