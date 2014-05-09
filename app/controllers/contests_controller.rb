class ContestsController < ApplicationController

  helper_method :survey, :participant

  # create a new attempt to this survey
  def new
    @survey =  Survey::Survey.active.last
    @attempt = @survey.attempts.new
    @attempt.answers.build
    @participant = current_user # you have to decide what to do here
  end

  # create a new attempt in this survey
  # an attempt needs to have a participant assigned
  def create
    @survey = Survey::Survey.active.last
    @attempt = @survey.attempts.new(attempt_params)
    @attempt.participant = current_user
    if @attempt.valid? and @attempt.save
      redirect_to view_context.new_attempt_path, alert: I18n.t("attempts_controller.#{action_name}")
    else
      flash.now[:error] = @attempt.errors.full_messages.join(', ')
      render :action => :new
    end
  end

  private

  def attempt_params
    params.require(:survey_attempt).permit(answers_attributes: [:id, :question_id, :option_id, :option_text, :option_number, :predefined_value_id, :_destroy, :finished])
  end
end
