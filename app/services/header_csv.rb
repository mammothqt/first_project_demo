class HeaderCsv
  def initialize attributes, csv
    @attributes = attributes
    @csv = csv
  end

  def perform
    arr_header = attributes.inject([]) do |arr, attr|
      if ExportCsv::RowFormat::ARR_DECORATE_RELATION.include? attr
        10.times do |n|
          decorate_relationship(attr).each do |decorate|
            arr << (I18n.t("header_csv.#{decorate}", number: n.next))
          end
        end
      else
        arr << (I18n.t("header_csv.#{attr}"))
      end
      arr
    end
    csv << arr_header.map { |header| header }
  end

  private
  attr_reader :attributes, :csv

  def decorate_relationship attr
    relation = ExportCsv::RowFormat::RELATIONSHIP_EXPORT_CSV.detect{
      |r| attr.include? Settings.public_send r
    }
    Settings.public_send("decorate_#{relation}")
  end
end
