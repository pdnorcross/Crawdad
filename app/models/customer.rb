class Customer < ActiveRecord::Base

  def self.search(search)
    where('name LIKE ?', '%#{search}%')
    where('last_4 LIKE ?', '%#{search}%')
  end


end
