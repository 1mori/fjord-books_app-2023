class AddCorrectUniqueIndexToMentionReports < ActiveRecord::Migration[7.0]
  def change
    add_index :mention_reports, [:mentioned_report_id, :mentioning_report_id], unique: true, name: 'index_mention_reports_on_reports_ids'
  end
end
