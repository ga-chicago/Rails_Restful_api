class PeopleController < ApplicationController

  def list
    # return all people in an []
    @people = Person.all

    # explicitly declare non-views to be returned
    # in our case - JSON
    render json: @people

  end

  def create
    # create an individual person
    @person = Person.create(
      :name => params[:name],
      :hobby => params[:hobby]
    )

    render json: @person

  end

  def read
    # return an individual person
  end

  def update
    # update our person by id
  end

  def destroy
    # delete our person by id
  end
end
