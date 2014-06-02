class AddTestRunToChallengeAttempt < ActiveRecord::Migration
  def change
    add_column :challenge_attempts, :test, :boolean
  end
end
