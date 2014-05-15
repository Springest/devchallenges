class Admin::SurveysController < ApplicationController
  def sections
    survey = Survey::Survey.find(params[:id])    
    sections = []

    survey.sections.each do |section|
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
      
      sections.push(fullSection)
    end
    
    respond_to do |format|
      format.json { render json: sections }
    end
  end
end
