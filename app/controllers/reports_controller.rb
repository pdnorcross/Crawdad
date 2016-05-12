class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def generate_reports
    reports_value = {}
    reports_value['date 1'] = DateTime.parse(params[:date1]).to_s(:db)
    reports_value['date 2'] = DateTime.parse(params[:date2]).to_s(:db)
    total_hours = 0


    customers = Customer.where("(customers.created_at > '#{reports_value['date 1']}' AND
                      customers.updated_at < '#{reports_value['date 2']}') OR (customers.updated_at >
                      '#{reports_value['date 1']}' AND customers.created_at < '#{reports_value['date 2']}')")

    customers_4 = 4

    customers_5 = 5


    dependents = Dependent.where("(dependents.created_at > '#{reports_value['date 1']}' AND
                      dependents.updated_at < '#{reports_value['date 2']}') OR (dependents.updated_at > '#{reports_value['date 1']}' AND
                      dependents.created_at < '#{reports_value['date 2']}')")

    # volunteers = Volunteer.where("volunteers.last_login >= '#{reports_value['date 1']}' AND
    #                   (volunteers.last_login <= '#{reports_value['date 2']}' ")
    #
    # volunteers.each do
    #   total_hours += volunteers.hours
    # end


    @reports = Report.find_by(id: 1)

    if @reports.nil?
      @reports = Report.create(
          total_recipients: ((customers.length) + (dependents.length)),
          new_clients: customers.where('created_at >= ?', reports_value['date 1']).length,
          total_seniors: customers.where('age > ?', 64).length + (dependents.where('age > ?', 64).length),
          total_adults: customers.length + (dependents.where('age > ?', 17).length),
          total_children: (dependents.where('age < ?', 18).length),
          total_families: customers.length,
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
        total_adults: customers.length + (dependents.where('age > ?', 17).length),
        total_children: (dependents.where('age < ?', 18).length),
        total_families: customers.length,
        four: 4,
        five: 5,
        # unemployed: (customers.where(unemployed: true).length)
    )
      end

    redirect_to :back
  end

end