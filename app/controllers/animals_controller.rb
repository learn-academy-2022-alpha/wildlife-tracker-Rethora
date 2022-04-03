class AnimalsController < ApplicationController
  def index
    animals = Animal.all
    render json: animals.as_json(include: :sightings)
  end
  
  def update
    animal = Animal.find(params[:id])
    animal.update(animal_params)
    if animal.valid?
      render json: animal
    else
      render json: animal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    animal = Animal.destroy(params[:id])
    if animal.destroy
      render json: animal
    else
      render json: animal.errors
    end
  end

  def create
    p params
    animal = Animal.create(animal_params)
    if animal.valid?
      render json: animal
    else
      render json: animal.errors, status: :unprocessable_entity
    end
  end

  private
  def animal_params
    params.require(:animal).permit(
      :common_name, 
      :latin_name, 
      :kingdom, 
      sightings_attributes: [
        :date, 
        :longitude, 
        :latitude
      ]
    )
  end
end
