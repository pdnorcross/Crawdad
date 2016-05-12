class VolunteersController < ApplicationController

  def index
    if params[:search]
      @volunteers = Volunteer.search(params[:search])
    end
  end

  def new
    @volunteer = Volunteer.new
  end

  def show
    @volunteer = Volunteer.find(params[:id])
  end

  def request_sign_in
    volunteers = Volunteer.find_by(name: params[:name])


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
        calculated_hours = ((Math.sqrt((volunteers.updated_at - DateTime.now)**2) / 1.hour) + volunteers.hours)
        volunteers.update(
            login_status: false,
            hours: calculated_hours )
      end
    end
    volunteers.save!
    redirect_to :back

  end


  private

  def volunteer_params
    params.require(:volunteer).permit(:name)
  end

end