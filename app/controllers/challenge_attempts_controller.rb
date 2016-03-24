class ChallengeAttemptsController < ApplicationController
  before_filter :set_challenge
  before_filter :set_user
  def new
    @challenge_attempt = ChallengeAttempt.new(code: @challenge.code)
  end
  
  def create
    @challenge_attempt = ChallengeAttempt.new(challenge_attempt_params)
    @challenge_attempt.user = @user
    @challenge_attempt.challenge = @challenge
    @challenge_attempt.save
    render 'edit'
  end
 
  def update
    @challenge_attempt = ChallengeAttempt.find(params[:id])
    @challenge_attempt.attempts += 1
    @challenge_attempt.update(challenge_attempt_params)
    render 'edit'
  end
  
  
  def destroy
  
  end
  
  private
  
  def challenge_attempt_params
    params.require(:challenge_attempt).permit(:code,:test_code, :test, :user_id,:challenge_id)
  end
  def set_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end
  def set_user
    @user = current_user
  end
end
