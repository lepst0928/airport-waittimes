class AirportsController < ApplicationController
  def index
    matching_airports = Airport.all

    @list_of_airports = matching_airports.order({ :created_at => :desc })

    render({ :template => "airports/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_airports = Airport.where({ :id => the_id })

    @the_airport = matching_airports.at(0)

    render({ :template => "airports/show.html.erb" })
  end

  def create
    the_airport = Airport.new
    the_airport.code = params.fetch("query_code")
    the_airport.name = params.fetch("query_name")
    the_airport.city = params.fetch("query_city")
    the_airport.state = params.fetch("query_state")
    the_airport.lat = params.fetch("query_lat")
    the_airport.long = params.fetch("query_long")
    the_airport.waittime = params.fetch("query_waittime")

    if the_airport.valid?
      the_airport.save
      redirect_to("/airports", { :notice => "Airport created successfully." })
    else
      redirect_to("/airports", { :notice => "Airport failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_airport = Airport.where({ :id => the_id }).at(0)

    the_airport.code = params.fetch("query_code")
    the_airport.name = params.fetch("query_name")
    the_airport.city = params.fetch("query_city")
    the_airport.state = params.fetch("query_state")
    the_airport.lat = params.fetch("query_lat")
    the_airport.long = params.fetch("query_long")
    the_airport.waittime = params.fetch("query_waittime")

    if the_airport.valid?
      the_airport.save
      redirect_to("/airports/#{the_airport.id}", { :notice => "Airport updated successfully."} )
    else
      redirect_to("/airports/#{the_airport.id}", { :alert => "Airport failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_airport = Airport.where({ :id => the_id }).at(0)

    the_airport.destroy

    redirect_to("/airports", { :notice => "Airport deleted successfully."} )
  end
end
