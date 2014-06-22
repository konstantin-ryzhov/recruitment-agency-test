class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :set_skills, only: [:create, :update]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    vacancies = Array.new
    @suitable = Array.new
    @partially = Array.new

    @employee.skills.each do |skill|
      vacancies.concat skill.vacancies.where("valid_until > ?",DateTime.now).to_a
    end
    vacancies.uniq!
    
    vacancies.each do |v|
      if v.skills - @employee.skills == []
        @suitable.push v
      else
        @partially.push v
      end
    end

    @suitable.sort_by! { |v| v.salary }
    @suitable.reverse!
    @partially.sort_by! { |v| v.salary }
    @partially.reverse!
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @skills = @employee.skills.map { |s| s.name }
  end

  # GET /employees/1/edit
  def edit
    @skills = @employee.skills.map { |s| s.name }
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
        insert_skills_into_item @employee
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
        insert_skills_into_item @employee
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def set_skills
      @skills = params[:skills] ? params[:skills] : Array.new
    end

    def insert_skills_into_item item
      if item and not item.new_record?
        item.skills.clear
        @skills.uniq.each do |s|
          skill = Skill.find_by_name(s)
          if skill
            item.skills << skill
          else
            item.skills.create(name: s)
          end
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :contacts, :state, :salary)
    end
end
