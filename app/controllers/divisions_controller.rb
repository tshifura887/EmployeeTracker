class DivisionsController < ApplicationController
  before_action :set_division, only: %i[ show edit update destroy ]

  def index
    @divisions = Division.all
  end

  def show
  end

  def new
    @division = Division.new
  end

  def edit
  end

  def create
    @division = Division.new(division_params)
    if @division.save
      redirect_to division_url(@division), notice: "Division was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def update
    if @division.update(division_params)
      redirect_to division_url(@division), notice: "Division was successfully updated." 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @division.destroy
    redirect_to divisions_url, notice: "Division was successfully destroyed."
  end

  private
    def set_division
      @division = Division.find(params[:id])
    end

    def division_params
      params.require(:division).permit(:name)
    end
end
