class ChangeStringsToText < ActiveRecord::Migration
  def change
    change_column :challenge_attempts, :code, :text
    change_column :challenge_attempts, :test_code, :text
    change_column :challenge_attempts, :result, :text
    
    change_column :challenges, :code, :text
    change_column :challenges, :tests, :text
    change_column :challenges, :description, :text

  end
end
