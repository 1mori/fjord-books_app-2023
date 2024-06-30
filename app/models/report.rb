# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :mentioning_relationships, class_name: 'MentionReport', dependent: :destroy, foreign_key: :mentioning_report_id, inverse_of: :mentioning_report
  has_many :mentioning_reports, through: :mentioning_relationships, source: :mentioned_report

  has_many :mentioned_relationships, class_name: 'MentionReport', dependent: :destroy, foreign_key: :mentioned_report_id, inverse_of: :mentioned_report
  has_many :mentioned_reports, through: :mentioned_relationships, source: :mentioning_report

  validates :title, presence: true
  validates :content, presence: true

  after_save :save_mentions

  def editable?(target_user)
    user == target_user
  end

  def created_on
    created_at.to_date
  end

  private

  def save_mentions
    mentioning_relationships.destroy_all

    url = %r{http://localhost:3000/reports/(\d+)}
    ids = content.to_s.scan(url).flatten.uniq
    reports = Report.where(id: ids).where.not(id:)

    reports.each do |report|
      MentionReport.create(mentioning_report: self, mentioned_report: report)
    end
  end
end
