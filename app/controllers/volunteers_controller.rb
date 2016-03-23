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
        volunteer.updated_at = DateTime.now

      else

       hours = hours(volunteer)
       volunteer.hours = hours + time
       last_month = last_month(volunteer)

          if last_month == true
            volunteer.hours_month = hours + new_hours
          else
            volunteer.hours_month = hours
          end

        volunteer.login_status = false

      end

    else

      volunteer = Volunteer.create(volunteer_params)
      if volunteer.save
        redirect_to volunteer
      else
        render 'new'
      end

    end

    end




  private

  def volunteer_params
    params.require(:volunteer).permit(:name)
  end

  def last_month(volunteer)

    if volunteer
      last_month = true
    else
      last_month = false
    end

    return last_month

  end

  def current_time
    time = 10
    time = DateTime.now - (time/24.0)
    return time
  end

  def hours(volunteer)
    hours = DateTime.now - volunteer.last_login
    return hours
  end





end