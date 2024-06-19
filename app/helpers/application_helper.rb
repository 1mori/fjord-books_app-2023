# frozen_string_literal: true

module ApplicationHelper
  def pluralize_i18n(word)
    I18n.locale == :ja ? word : word.pluralize
  end
end
