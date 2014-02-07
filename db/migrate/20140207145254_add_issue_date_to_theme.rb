class AddIssueDateToTheme < ActiveRecord::Migration
  def change
    add_column :themes, :issue_date, :date
  end
end
