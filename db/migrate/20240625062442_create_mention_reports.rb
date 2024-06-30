class CreateMentionReports < ActiveRecord::Migration[7.0]
  def change
    create_table :mention_reports do |t|
      t.references :mentioned_report, null: false, foreign_key: { to_table: 'reports' }, index: false
      t.references :mentioning_report, null: false, foreign_key: { to_table: 'reports' }

      t.timestamps
    end
  end
end
