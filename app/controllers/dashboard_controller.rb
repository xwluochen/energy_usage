class DashboardController < ApplicationController
  def index
    @years = Cost.select(:year).distinct.map(&:year)
    @selected_year = @years.first
    cost_per_year
  end
  
  def usage_filter
    @selected_year = params[:year]
    cost_per_year    
    render :partial => 'usages', :locals => { :addresses => @addresses, :measurements => @measurements, :month_costs => @month_costs, :current_year => @selected_year }
  end

protected
  def cost_per_year
    @measurements = Measurement.order("usage asc")
    @addresses = Address.order("location asc")
    @month_costs = Cost.where(year: @selected_year).group(["address_id", "measurement_id"]).sum(:month_cost)
  end
end