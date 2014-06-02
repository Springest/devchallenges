class AddCodeToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :code, :string
  end
end
