class Volunteer < ActiveRecord::Base

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

  def submit
    redirect_to "volunteers/new"
  end

end
