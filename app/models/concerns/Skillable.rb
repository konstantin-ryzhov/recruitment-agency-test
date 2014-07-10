module Skillable
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :skills
  end

  def skills_array=(value)
    skills.clear

    value.uniq.each do |s|
      skill = Skill.find_or_create_by name: s
      skills << skill
    end
  end

  def skills_array
    skills.map { |i| i.name }.to_json
  end

end