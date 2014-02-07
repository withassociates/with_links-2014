class AddIssueNumberToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :issue_number, :integer
  end
end
