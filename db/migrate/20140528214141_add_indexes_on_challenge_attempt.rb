class AddIndexesOnChallengeAttempt < ActiveRecord::Migration
  def change
    add_index :challenge_attempts, :user_id
    add_index :challenge_attempts, :challenge_id
  end
end
