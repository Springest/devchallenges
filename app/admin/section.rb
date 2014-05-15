ActiveAdmin.register Survey::Section do
  
  member_action :show do
    
    section = Survey::Section.find(params[:id])
    
    fullSection = section.attributes
    fullSection[:questions] = []
    
    section.questions.each do |question|
      fullQuestion = question.attributes
      fullQuestion[:options] = []
      question.options.each do |option|
        fullQuestion[:options].push(option)
      end
    
      fullSection[:questions].push(fullQuestion)
    end
    
  
    respond_to do |format|
      format.json { render json: fullSection }
    end
  
  end
end
