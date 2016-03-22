class VolunteersController < ApplicationController
  def index
  end

  def create
    @volunteer = Volunteer.create(volunteer_params)

    if @volunteer.save
      redirect_to @volunteer
    else
      render 'new'
    end
  end

  def submit_hours
        volunteer = Volunteer.where(name: name)
    if volunteer.exist?

      if volunteer.login_status == false
       volunteer.login_status = true
       volunteer.last_login = DateTime.now
       volunteer.updated_at = date.current
      else
        time = 10
        hours = volunteer.updated_at - (time/24.0)
        time = DateTime.now - (time/24.0)
        volunteer.hours = hours + time
          if last_month == true
            volunteer.hours_month = hours + new_hours
          else
            volunteer.hours_month = hours
          end
        volunteer.login_status = false
     end

    else
      volunteer = Volunteer.create(volunteer_params)
      if @volunteer.save
        redirect_to @volunteer
      else
        render 'new'
      end
    end

    end




  private

  def volunteer_params
    params.require(:volunteer).permit(:name)
  end

  def last_month

  end



end