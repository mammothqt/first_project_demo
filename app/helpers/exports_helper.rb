module ExportsHelper

  def export_path(model, owner)
    if owner
      exports_path(format: :csv, owner: { model: owner.class, id: owner.id })
    else
      exports_path(format: :csv, objects: { model: model})
    end
  end
end
