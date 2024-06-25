class MentionReport < ApplicationRecord
  belongs_to :mentioned_report
  belongs_to :mentioning_report
end
