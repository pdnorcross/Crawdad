class VolunteersController < ApplicationController

  def index
    @volunteers = Volunteer.all
  end

  def new
    @volunteer = Volunteer.new
  end

  def show
    @volunteer = Volunteer.find(params[:id])
  end

  def request_sign_in
    volunteers = Volunteer.find_by(name: params[:name])
    calculated_hours = ((Math.sqrt((volunteers.updated_at - DateTime.now)**2) / 1.hour) + volunteers.hours)

    if volunteers.nil?
      volunteers = Volunteer.create(
          name: params[:name],
          last_login: DateTime.now,
          login_status: true,
          hours: 0
      )
    else
      if volunteers.login_status == false
        volunteers.update(
            login_status: true,
            last_login: DateTime.now )
      else
        # calculated_hours = current_hours(volunteer_value['name'])
        volunteers.update(
            login_status: false,
            hours: calculated_hours )
      end
  end
    volunteers.save!
    redirect_to :back
  end


  # def post_request_sign_in
  #   require 'mechanize'
  #   mechanize = Mechanize.new
  #   post_hash = {
  #       'name'               => :name,
  #      }
  #   mechanize.post('http://localhost:3000/api/v1/volunteers/signed_in', post_hash)
  #
  #   redirect_to :new
  # end


  private

  def volunteer_params
    params.require(:volunteer).permit(:name)
  end

end