require "csv"

class ExportCsvService

  def initialize(objects)
    @objects = objects.decorate
    @attribute_export = objects.klass.attribute_export
  end

  def perform
    CSV.generate do |csv|
      @csv = csv
      HeaderCsv.new(attribute_export, csv).perform
      export_content
    end
  end

  private
  attr_reader :attribute_export, :objects, :csv

  def export_content
    objects.each do |object|
      push_line(object)
    end
  end

  def push_line(object)
    data_export = DataCsv.new(attribute_export, object).performs
    csv << data_export
  end
end
