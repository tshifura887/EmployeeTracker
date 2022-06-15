class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[ show edit update destroy ]

  def index
    @divisions = Division.all
    div = params[:div]
    if !div.nil?
      @employees = Employee.where(division_id: div)
    else
      @employees = Employee.all
    end
  end

  def show
    @employee = Employee.find_by(id: params[:id])
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employee_url(@employee), notice: "Employee was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_url(@employee), notice: "Employee was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_url, notice: "Employee was successfully destroyed." 
  end

  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :division_id, project_ids: [])
    end
end
