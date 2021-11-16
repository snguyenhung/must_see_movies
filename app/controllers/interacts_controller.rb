class InteractsController < ApplicationController
  before_action :current_user_must_be_interact_user,
                only: %i[edit update destroy]

  before_action :set_interact, only: %i[show edit update destroy]

  # GET /interacts
  def index
    @q = Interact.ransack(params[:q])
    @interacts = @q.result(distinct: true).includes(:movie,
                                                    :user).page(params[:page]).per(10)
  end

  # GET /interacts/1
  def show; end

  # GET /interacts/new
  def new
    @interact = Interact.new
  end

  # GET /interacts/1/edit
  def edit; end

  # POST /interacts
  def create
    @interact = Interact.new(interact_params)

    if @interact.save
      message = "Interact was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @interact, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /interacts/1
  def update
    if @interact.update(interact_params)
      redirect_to @interact, notice: "Interact was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /interacts/1
  def destroy
    @interact.destroy
    message = "Interact was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to interacts_url, notice: message
    end
  end

  private

  def current_user_must_be_interact_user
    set_interact
    unless current_user == @interact.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_interact
    @interact = Interact.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def interact_params
    params.require(:interact).permit(:user_id, :rating, :review, :movie_id,
                                     :bookmark)
  end
end
