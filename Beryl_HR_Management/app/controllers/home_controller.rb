class HomeController < ApplicationController
  def index
  	@employees = Employee.all
  end

  def new
  	@employee = Employee.new
  end

  def create
  	
  	@employee = Employee.create(employee_params)
  	redirect_to "/home#index"
    end

  def show
  	@employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
  	@employee.update(employee_params)

    redirect_to "/"
  end

  def employee_params
  params.require(:employee).permit(:first_name,:last_name,:role_id,:email,:password)
  end

end