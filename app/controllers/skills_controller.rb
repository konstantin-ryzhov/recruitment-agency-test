class SkillsController < ApplicationController
  # GET /skills
  # GET /skills.json
  def index
    if params[:query].nil?
      @skills = Skill
                  .order('vacancies_count + employees_count desc')
                  .paginate(:page => params[:page], :per_page => 5)
    else
      @skills = Skill.order(name: :asc).where(Skill.arel_table[:name].matches "%#{params[:query]}%").first(10)
    end
  end

  private
end
