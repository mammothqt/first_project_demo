class DataCsv

  def initialize attributes, candidate
    @attributes = attributes
    @candidate = candidate
  end

  def perform
    attributes.inject([]) do |arr, attr|
      if candidate.public_send(attr).is_a?(Array)
        candidate.public_send(attr).each { |value| arr << value }
      else
        arr << candidate.public_send(attr)
      end
      arr
    end
  end

  private
  attr_reader :attributes, :candidate
end
