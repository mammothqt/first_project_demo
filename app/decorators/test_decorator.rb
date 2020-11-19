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
    arr_relationship_export(questions, ExportCsv::ExportFormat::ATTRIBUTES_QUESTION)
  end

  private
  def arr_relationship_export(objects, attributes)
    arr_relationship = objects.map do |object|
      attributes.map do |attr|
        object.public_send(attr)
      end
    end.flatten
  end
end
