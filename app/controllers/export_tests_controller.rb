class ExportTestsController < ApplicationController
  def index
    csv = ExportCsvService.new Test.all
    respond_to do |format|
      format.csv { send_data "\uFEFF" + csv.perform, filename: "tests-#{Date.today}.csv" }
    end
  end
end
