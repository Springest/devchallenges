class CreateChallengeAttempts < ActiveRecord::Migration
  def change
    create_table :challenge_attempts do |t|
      t.string :code
      t.integer :user_id
      t.integer :challenge_id
      t.boolean :passed

      t.timestamps
    end
  end
end
