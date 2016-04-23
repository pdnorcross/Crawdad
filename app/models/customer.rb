class Customer < ActiveRecord::Base

has_many :donor 
accepts_nested_attributes_for :donor

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