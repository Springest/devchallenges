class ChallengeAttemptsController < ApplicationController
  def new
  
  end
  
  def create
  
  end
  
  def update
  
  end
  
  def update
  
  end
  
  def destroy
  
  end
  
  private
  
  def challenge_attempt_params
    params.require(:challenge_attempt).permit(:code,:user_id,:challenge_id)
  end
end
