class ExportUsersController < ApplicationController
  def index
    csv = ExportCsvService.new User.all
    respond_to do |format|
      format.csv { send_data "\uFEFF" + csv.perform, filename: "users-#{Date.today}.csv" }
    end
  end
end
