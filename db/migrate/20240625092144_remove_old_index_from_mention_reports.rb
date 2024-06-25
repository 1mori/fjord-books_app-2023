class RemoveOldIndexFromMentionReports < ActiveRecord::Migration[7.0]
  def change
    remove_index :mention_reports, [:mentioned_report, :mentioning_report], if_exists: true
  end
end
