module Api
    module V1
      class VolunteersController < Api::V1::BaseController

        def signed_in
          volunteer_value = {}
          volunteer_value['name'] = params(:name)
          calculated_hours = current_hours

          volunteers = Volunteer.find_by(name: volunteer_value['name'])

          if volunteers.empty?
            volunteers = Volunteer.Create(
                                     name: volunteer_value['name'],
                                     last_login: Date.now,
                                     login_status: true
            )
          else
            if volunteers.login_status == false
              volunteers.update(
                  login_status: true,
                  last_login: Date.now
              )
            else
              volunteers.update(
                login_status: false,
                hours: calculated_hours
                )

            end
          end

          private
            def

            end




      end
     end
    end
end
