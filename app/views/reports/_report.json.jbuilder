json.extract! report, :id, :report_title, :report_body, :created_at, :updated_at
json.url report_url(report, format: :json)
