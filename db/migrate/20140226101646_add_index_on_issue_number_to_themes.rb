class AddIndexOnIssueNumberToThemes < ActiveRecord::Migration
  def change
    add_index :themes, :issue_number
  end
end
