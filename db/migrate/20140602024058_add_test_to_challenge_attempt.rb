class AddTestToChallengeAttempt < ActiveRecord::Migration
  def change
    add_column :challenge_attempts, :test_code, :string
  end
end
