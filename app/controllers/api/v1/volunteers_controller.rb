module Api
    module V1
        class VolunteersController < Api::V1::BaseController

          def signed_in
            result = {}
            volunteer_value = {}
            volunteer_value['name'] = params[:name].to_s
            volunteers = Volunteer.find_by(name: volunteer_value['name'])
            calculated_hours = 10

            if volunteers.nil?
              volunteers = Volunteer.create(
                                     name: volunteer_value['name'],
                                     last_login: DateTime.now,
                                     login_status: true )
            else
              if volunteers.login_status == false
                volunteers.update(
                  login_status: true,
                  last_login: Date.now )
              else
                # calculated_hours = current_hours(volunteer_value['name'])
                volunteers.update(
                  login_status: false,
                  hours: calculated_hours )
              end
            end
            volunteers.save! ? result[:signed_in] = true : result[:error] = 'Sign In Failed'
            render json: result
          end

        private
          # def current_hours(name)
          #   volunteers = Volunteer.find_by(name: name)
          #   hours = volunteers.hours + (volunteers.last_login + DateTime.now).to_i
          #   return hours
          # end
        end
    end
end
