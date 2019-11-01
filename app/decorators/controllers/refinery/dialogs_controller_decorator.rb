Refinery::Admin::DialogsController.class_eval do
  Refinery::Admin::DialogsController::TYPES << 'video'
  def find_iframe_src
    if @dialog_type == 'image'
      @iframe_src = refinery.insert_admin_images_path(
        url_params.merge(:modal => true)
      )
    elsif @dialog_type == 'link'
      @iframe_src = refinery.link_to_admin_pages_dialogs_path url_params
    elsif  @dialog_type == 'video'
      @iframe_src = refinery.insert_videos_admin_videos_path url_params.merge(:dialog => true)
    end
  end
end
