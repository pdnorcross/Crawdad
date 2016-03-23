class Customer < ActiveRecord::Base

  def self.search_by_name(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else

    end
  end

  def self.search_by_last4(search)
    if search
      find(:all, :conditions => ['last_4 LIKE ?', "%#{search}%"])
    else

    end
  end


end
