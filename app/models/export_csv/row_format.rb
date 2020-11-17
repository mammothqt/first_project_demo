class ExportCsv::RowFormat
  ATTRIBUTE_EXPORT_TEST_CSV = %w(name description arr_questions).freeze

  ATTRIBUTE_EXPORT_USER_CSV = %w(full_name user_name email age sex).freeze

  ATTRIBUTE_EXPORT_USER_RESULT_CSV = %w(grade status).freeze

  RELATIONSHIP_EXPORT_CSV = %w(questions).freeze

  ARR_DECORATE_RELATION = %w(arr_questions).freeze

  ATTRIBUTES_QUESTION = %w(content).freeze
end
