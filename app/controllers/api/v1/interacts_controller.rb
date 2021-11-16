class Api::V1::InteractsController < Api::V1::GraphitiController
  def index
    interacts = InteractResource.all(params)
    respond_with(interacts)
  end

  def show
    interact = InteractResource.find(params)
    respond_with(interact)
  end

  def create
    interact = InteractResource.build(params)

    if interact.save
      render jsonapi: interact, status: :created
    else
      render jsonapi_errors: interact
    end
  end

  def update
    interact = InteractResource.find(params)

    if interact.update_attributes
      render jsonapi: interact
    else
      render jsonapi_errors: interact
    end
  end

  def destroy
    interact = InteractResource.find(params)

    if interact.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: interact
    end
  end
end
