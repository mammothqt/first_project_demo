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
    if params[:id]
      load_owner
      @objects = @owner.attribute_objects
    else
      @objects = params[:model].constantize.newest
    end
  end

  def load_owner
    @owner = ExportCsv::ExportFormat::MODEL_RELATIONSHIP_EXPORT[params[:model].to_sym]
                       .find_by(id: params[:id])
    raise ActiveRecord::RecordNotFound if @owner.blank?
  end
end
