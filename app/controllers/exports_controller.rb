class ExportsController < ApplicationController
  before_action :load_objects, olny: :index

  def index
    authorize!(:read, current_user)

    csv = ExportCsvService.new(@objects)
    respond_to do |format|
      format.csv {
        send_data "\uFEFF" + csv.perform,
        filename: I18n.t("exports.index.#{@objects.klass}", date: Date.current)
      }
    end
  end

  private

  def load_objects
    @objects = params[:owner] ? find_by_owner : find_by_params
  end

  def find_by_owner
    @owner = params[:owner][:model].constantize.find_by!(id: params[:owner][:id])
    @owner.attribute_objects
  end

  def find_by_params
    params[:objects][:model].constantize.newest
  end
end
