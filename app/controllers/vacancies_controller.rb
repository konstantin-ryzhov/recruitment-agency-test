class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:show, :edit, :update, :destroy]
  before_action :set_skills, only: [:create, :update]

  # GET /vacancies
  # GET /vacancies.json
  def index
    @vacancies = Vacancy.all
  end

  # GET /vacancies/1
  # GET /vacancies/1.json
  def show
    employees = Array.new
    @suitable = Array.new
    @partially = Array.new

    @vacancy.skills.each do |skill|
      employees.concat skill.employees.to_a
    end
    employees.uniq!
    
    employees.each do |e|
      if @vacancy.skills - e.skills == []
        @suitable.push e unless e.employed?
      else
        @partially.push e unless e.employed?
      end
    end

    @suitable.sort_by! { |e| e.salary }
    @partially.sort_by! { |e| e.salary }
  end

  # GET /vacancies/new
  def new
    @vacancy = Vacancy.new
    @skills = @vacancy.skills.map { |s| s.name }
  end

  # GET /vacancies/1/edit
  def edit
    @skills = @vacancy.skills.map { |s| s.name }
  end

  # POST /vacancies
  # POST /vacancies.json
  def create
    @vacancy = Vacancy.new(vacancy_params)

    respond_to do |format|
      if @vacancy.save
        format.html { redirect_to @vacancy, notice: 'Вакансия создана.' }
        format.json { render :show, status: :created, location: @vacancy }
        insert_skills_into_item @vacancy
      else
        format.html { render :new }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacancies/1
  # PATCH/PUT /vacancies/1.json
  def update
    respond_to do |format|
      if @vacancy.update(vacancy_params)
        format.html { redirect_to @vacancy, notice: 'Вакансия обновлена.' }
        format.json { render :show, status: :ok, location: @vacancy }
        insert_skills_into_item @vacancy
      else
        format.html { render :edit }
        format.json { render json: @vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacancies/1
  # DELETE /vacancies/1.json
  def destroy
    @vacancy.destroy
    respond_to do |format|
      format.html { redirect_to vacancies_url, notice: 'Вакансия удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
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
    def vacancy_params
      params.require(:vacancy).permit(:name, :created_at, :valid_until, :salary, :contacts, :skills)
    end
end
