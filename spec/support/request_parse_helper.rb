# frozen_string_literal: true

module RequestParseHelper
  def subject_json
    JSON.parse(response.body)
  end
end
