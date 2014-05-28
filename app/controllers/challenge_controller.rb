class ChallengesController < ApplicationController

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
  
  def challenge_params
    params.require(:challenge).permit(:tests, :name)
  end
  
end
