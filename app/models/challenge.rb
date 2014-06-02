class Challenge < ActiveRecord::Base
  has_many :challenge_attempts
  
  def number_of_attempts
    challenge_attempts.count
  end
  
  def times_solved
    challenge_attempts.solved.count
  end
end
