class InteractsController < ApplicationController
  before_action :set_interact, only: [:show, :edit, :update, :destroy]

  # GET /interacts
  def index
    @interacts = Interact.all
  end

  # GET /interacts/1
  def show
  end

  # GET /interacts/new
  def new
    @interact = Interact.new
  end

  # GET /interacts/1/edit
  def edit
  end

  # POST /interacts
  def create
    @interact = Interact.new(interact_params)

    if @interact.save
      redirect_to @interact, notice: 'Interact was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /interacts/1
  def update
    if @interact.update(interact_params)
      redirect_to @interact, notice: 'Interact was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /interacts/1
  def destroy
    @interact.destroy
    redirect_to interacts_url, notice: 'Interact was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interact
      @interact = Interact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interact_params
      params.require(:interact).permit(:user_id, :rating, :review, :movie_id, :bookmark)
    end
end
