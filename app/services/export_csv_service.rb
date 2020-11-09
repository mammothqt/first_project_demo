require "csv"

class ExportCsvService
  def initialize objects
    @attributes = attributes
    @objects = objects.decorate
  end

  def perform
    CSV.generate do |csv|
      @csv = csv
      HeaderCsv.new(ExportCsv::RowFormat::ATTRIBUTE_EXPORT_CSV, csv).perform
      export_content
    end
  end

  private
  attr_reader :attributes, :objects, :csv

  def export_content
    objects.each do |object|
      push_line object
    end
  end

  def push_line object
    data_export = DataCsv.new(ExportCsv::RowFormat::ATTRIBUTE_EXPORT_CSV, object).perform
    csv << data_export
  end
end
