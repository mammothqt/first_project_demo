class UserResultDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  def created_at_format
    helpers.content_tag :span, class: 'time' do
      object.created_at.strftime("%d/%m/%y")
    end
  end
end
