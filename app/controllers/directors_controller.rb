class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })
    
    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def youngest

    @youngest_director_dob = Director.maximum(:dob)

    youngest_director = Director.where({ :dob => @youngest_director_dob })

    @youngest_director = youngest_director.at(0)

    render({ :template => "director_templates/youngest"})
  end

  def eldest

    @eldest_director_dob = Director.minimum(:dob)

    eldest_director = Director.where({ :dob => @eldest_director_dob })

    @eldest_director = eldest_director.at(0)

    render({ :template => "director_templates/eldest"})
  end

end
