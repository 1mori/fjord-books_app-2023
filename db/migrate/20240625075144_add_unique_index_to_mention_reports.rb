class AddUniqueIndexToMentionReports < ActiveRecord::Migration[7.0]
  def change
    add_index :mention_reports, [:mentioned_report, :mentioning_report], unique: true
  end
end
