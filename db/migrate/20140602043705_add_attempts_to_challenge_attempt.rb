class AddAttemptsToChallengeAttempt < ActiveRecord::Migration
  def change
    add_column :challenge_attempts, :attempts, :integer
  end
end
