class ChallengesController < ApplicationController

  def new
    @challenge = Challenge.new
  end
  
  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      redirect_to @challenge
    else
      flash[:error] = @item.errors.full_messages.to_sentence
      render 'new'
    end
  end
  
  def show
    @challenge = Challenge.find(params[:id])
  end
  
  def update
  
  end
  
  def update
  
  end
  
  def destroy
  
  end
  
  private
  
  def challenge_params
    params.require(:challenge).permit(:name)
  end
  
end
