module Api
  module V1
    class ReportsController < Api::V1::BaseController


      def generate_report
        reports_value = {}
        reports_value['date 1'] = params[:date1]
        reports_value['date 2'] = params[:date2]
        total_hours = 0


        customers = Customers.where("(customers.created_at >= '#{reports_value['date 1']}' AND
                      customers.created_at <= '#{reports_value['date 2']}') OR (customers.updated_at >=
                      '#{reports_value['date 1']}' AND customers.created_at <= '#{reports_value['date 2']})")

        customers_4 = 4

        customers_5 = 5


        dependents = Dependents.where("(dependents.created_at >= '#{reports_value['date 1']}' AND
                      dependents.created_at <= '#{reports_value['date 2']}') ((dependents.updated_at >= '#{reports_value['date 1']}' AND
                      dependents.updated_at <= '#{reports_value['date 2']})")

        volunteers = Dependents.where("volunteers.last_login >= '#{reports_value['date 1']}' AND
                      (volunteers.last_login <= '#{reports_value['date 2']}' ")

        volunteers.each do
          total_hours += volunteers.hours
        end


        reports = Reports.update(
                             total_recipients: (count(customers.all) + count(dependents.all)),
                             new_clients: count(customers.where('created_at >= ?', reports_value['date 1']).and.where('created_at <= ?', reports_value['date 2'])),
                             total_seniors: count(customers.where('age > ?', 64)) + count(dependents.where('age > ?', 64)),
                             total_adults: count(customers.all) + count(dependents.where('age > ?', 17)),
                             total_children: count(dependents.where('age < ?', 18)),
                             total_families: count(),
                             four: count(customers_4.all),
                             five: count(customers_5.all),
                             unemployed: count(customers.where(unemployed: true)),
                             volunteers: count(volunteers.all),
                             vol_hours: total_hours
        )
        reports.save!
      end
    end
  end
end
