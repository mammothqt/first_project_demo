class ExportCsv::ExportFormat
  ATTRIBUTE_EXPORT_TEST_CSV = %w(name description arr_questions).freeze

  ATTRIBUTE_EXPORT_USER_CSV = %w(full_name user_name email age user_sex).freeze

  ATTRIBUTE_EXPORT_USER_RESULT_CSV = %w(test_name created_at number_correct grade
    result_announcement).freeze

  ATTRIBUTE_EXPORT_CATEGORY_CSV = %w(name description)

  ATTRIBUTE_EXPORT_COURSE_CSV = %w(name description)

  RELATIONSHIP_EXPORT_CSV = %w(questions).freeze

  ARR_DECORATE_RELATION = %w(arr_questions).freeze

  ATTRIBUTES_QUESTION = %w(content).freeze

  MODEL_DECORATOR_EXPORT = %w(Test).freeze
end
