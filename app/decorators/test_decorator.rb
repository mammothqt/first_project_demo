class TestDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def arr_questions
    arr_relationship_export questions, ExportCsv::RowFormat::ATTRIBUTES_QUESTION, 10
  end

  private
  def arr_relationship_export objects, attributes, max_column_export
    arr_relationship = objects.limit(10).map do |object|
      attributes.map do |attr|
        object.public_send(attr)
      end
    end.flatten
    number = max_column_export - arr_relationship.count
    arr_relationship.concat([""] * number)
  end
end