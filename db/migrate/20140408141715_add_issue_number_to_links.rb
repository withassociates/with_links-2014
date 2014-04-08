class AddIssueNumberToLinks < ActiveRecord::Migration
  def change
    add_column :links, :issue_number, :integer
  end
end
