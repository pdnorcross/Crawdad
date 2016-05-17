class ReportsController < ApplicationController
  require 'date'

  def index
    @reports = Report.all
  end

  def generate_reports
    reports_value = {}
    reports_value['date 1'] = Date.strptime(params[:date1], '%m/%d/%Y')
    reports_value['date 2'] = Date.strptime(params[:date2], '%m/%d/%Y')
    total_hours = 0


    customers = Customer.where("(customers.created_at > '#{reports_value['date 1']}' AND
                      customers.updated_at < '#{reports_value['date 2']}') OR (customers.updated_at >
                      '#{reports_value['date 1']}' AND customers.created_at < '#{reports_value['date 2']}')")

    customers_4 = 4

    customers_5 = 5


    dependents = Dependent.where("(dependents.created_at > '#{reports_value['date 1']}' AND
                      dependents.updated_at < '#{reports_value['date 2']}') OR (dependents.updated_at > '#{reports_value['date 1']}' AND
                      dependents.created_at < '#{reports_value['date 2']}')")

    volunteers = Volunteer.where("(volunteers.created_at > '#{reports_value['date 1']}' AND
                      volunteers.updated_at < '#{reports_value['date 2']}') OR (volunteers.updated_at >
                      '#{reports_value['date 1']}' AND volunteers.created_at < '#{reports_value['date 2']}')")


    total_new_seniors  = customers.where('created_at >= ?', reports_value['date 1']).where('age > ?', 64).length + (dependents.where('age > ?', 64).length)

    vol_hours = volunteers.sum(:hours)

    @reports = Report.find_by(id: 1)

    if @reports.nil?
      @reports = Report.create(
          total_recipients: ((customers.length) + (dependents.length)),
          new_clients: customers.where('created_at >= ?', reports_value['date 1']).length,
          total_seniors: customers.where('age > ?', 64).length + (dependents.where('age > ?', 64).length),
          new_seniors: total_new_seniors,
          total_adults: customers.length + (dependents.where('age > ?', 17).length),
          new_adults: customers.where('created_at > ?', reports_value['date 1']).where('age < ?', 64).length,
          total_children: (dependents.where('age < ?', 18).length),
          new_children: dependents.where('created_at > ?', reports_value['date 1']).where('age < ?', 18).length,
          total_families: customers.length,
          new_families: customers.where('created_at > ?', reports_value['date 1']).length,
          volunteers: volunteers.length,
          vol_hours: vol_hours,
          four: 4,
          five: 5,
      # unemployed: (customers.where(unemployed: true).length)
      )
      @reports.save!
    else
    @reports = Report.find_by(id: 1).update(
        total_recipients: ((customers.length) + (dependents.length)),
        new_clients: customers.where('created_at >= ?', reports_value['date 1']).length,
        total_seniors: customers.where('age > ?', 64).length + (dependents.where('age > ?', 64).length),
        new_seniors: total_new_seniors,
        total_adults: customers.length + (dependents.where('age > ?', 17).length),
        new_adults: customers.where('created_at > ?', reports_value['date 1']).where('age < ?', 64).length,
        total_children: (dependents.where('age < ?', 18).length),
        new_children: dependents.where('created_at > ?', reports_value['date 1']).where('age < ?', 18).length,
        total_families: customers.length,
        new_families: customers.where('created_at > ?', reports_value['date 1']).length,
        volunteers: volunteers.length,
        vol_hours: vol_hours,
        four: 4,
        five: 5,
        # unemployed: (customers.where(unemployed: true).length)
    )
      end

    redirect_to :back
  end

end