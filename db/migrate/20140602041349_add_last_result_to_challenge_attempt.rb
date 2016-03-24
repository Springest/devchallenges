class AddLastResultToChallengeAttempt < ActiveRecord::Migration
  def change
    add_column :challenge_attempts, :result, :string
  end
end
