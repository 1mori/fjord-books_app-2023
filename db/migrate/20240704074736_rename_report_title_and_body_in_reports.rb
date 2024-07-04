class RenameReportTitleAndBodyInReports < ActiveRecord::Migration[7.0]
  def change
    rename_column :reports, :report_title, :title
    rename_column :reports, :report_body, :body
  end
end
