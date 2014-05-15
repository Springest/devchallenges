ActiveAdmin.register Survey::Survey do
  menu :label => I18n.t("surveys")

  filter  :name,
  :as => :select,
  :collection => proc {
    Survey::Survey.select("distinct(name)").collect { |c|
      [c.name, c.name]
    }
  }
  filter :active,
  :as => :select,
  :collection => ["true", "false"]

  filter :created_at

  index do
    column :name
    column :description
    column :active
    column :attempts_number
    column :finished
    column :created_at
    default_actions
  end
    
  member_action :edit, :method => :get do
    survey = Survey::Survey.find(params[:id])
    fullSurvey = survey.attributes
    fullSurvey[:sections] = survey.sections
  
    respond_to do |format|
      format.html 
      format.json { render json: fullSurvey }
    end
  
  end
  
  controller do
    def permitted_params
      params.permit!
    end
  end
end
