class Customer < ActiveRecord::Base

has_many :dependent 
accepts_nested_attributes_for :dependent

def self.search(search)
  where("last_4 LIKE ?", "%#{search}%")
  where("fname LIKE ?", "%#{search}%")
end

  def submit
  	redirect_to "customers/show"
  end
end