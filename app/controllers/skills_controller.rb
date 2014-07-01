class SkillsController < ApplicationController
  before_action :set_skill, only: [:destroy]
  before_action :set_parent, only: [:destroy, :create]

  autocomplete :skill, :name, :full => true

  # GET /skills
  # GET /skills.json
  def index
    @skills = Skill.all
    @skill = Skill.new
  end

  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.find_by(skill_params)
    @skill = Skill.create(skill_params) unless @skill

    if @parent
      @parent.skills << @skill unless @parent.skills.exists? @skill
      respond_to do |format|
        format.html { redirect_to [:edit, @parent] , notice: 'Умение добавлено.' }
      end
    else
      respond_to do |format|
        unless @skill.errors.any?
          format.html { redirect_to skills_url, notice: "Умение \"#{@skill.name}\" создано." }
          format.json { render :show, status: :created, location: @skill }
        else
          format.html { render :new }
          format.json { render json: @skill.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    if @parent
      @parent.skills.delete(@skill)
      respond_to do |format|
        format.html { redirect_to [:edit, @parent], notice: 'Умение удалено.' }
      end
    else
      @skill.destroy
      respond_to do |format|
        format.html { redirect_to skills_url, notice: 'Умение удалено.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    def set_parent
      @parent = Employee.find(params[:employee_id]) if params[:employee_id]
      @parent = Vacancy.find(params[:vacancy_id]) if params[:vacancy_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:name)
    end
end
