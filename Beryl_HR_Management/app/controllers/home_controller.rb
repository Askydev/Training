class HomeController < ApplicationController
  def index
    @employees = Employee.all#.search(params[:search]).order(params[:sort]).paginate(page: params[:page], per_page: 7)
    respond_to do |format|
      format.html
      format.json { render json: EmployeesDatatable.new(view_context) }
    end
  end

  def new
  	@employee = Employee.new
  	@employee.addresses.new

  end

  def create
  	@employee = Employee.create(employee_params)    
    if @employee.save 
      EmployeeMailer.signup_confirmation(@employee).deliver_later
      respond_to do |format|  
       format.js { render 'home/show_create_view'}
      end
    else
      render :new
    end
  end

  def show
  	@employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
    #@employee.addresses.update(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
  	@employee.update(employee_params)
    respond_to do |format|  
      format.js { render 'home/show_updated_view'}
    end
  	#@employee.update(addresses_attributes:[:ad_name => 'Delhi'])
    #render :show
    
  end

  def delete
  end

  def destroy
  	@employee = Employee.find(params[:id])
  	@employee.destroy
  	redirect_to "/"
  end

  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :role_id, :email, :password, :permanent_address, :current_address, :gender_id, :designation_id, :department_id, :dob,:employee_code,:current_salary, addresses_attributes: [:id,:ad_name], skill_ids:[])
  end
  
end
