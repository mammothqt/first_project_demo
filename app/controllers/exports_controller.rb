class ExportsController < ApplicationController

  def index
  	authorize! :read, current_user
    csv = ExportCsvService.new(params[:model].constantize)
    respond_to do |format|
      format.csv { send_data "\uFEFF" + csv.perform, filename: "#{params[:model]}-#{Date.today}.csv" }
    end
  end
end
