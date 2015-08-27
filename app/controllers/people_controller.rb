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
    @person = Person.find(params[:id])

    render json: @person

  end

  def update
    # update our person by id
    @person = Person.find(params[:id])

    @person.update({
      :name => params[:name],
      :hobby => params[:hobby]
    })

    render json: @person
  end

  def destroy
    # delete our person by id
    @person = Person.find(params[:id])
    @person.destroy

    @message = {:message => 'A person with an id of ' + params[:id] + ' has been destroyed.'}

    render json: @message
  end
end
