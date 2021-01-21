class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(params[:id])
    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species}
    else
      render json: { message: 'No birds here man'}
    end
  end
end