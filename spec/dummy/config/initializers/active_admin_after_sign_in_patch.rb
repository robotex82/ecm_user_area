class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    if resource.kind_of?(AdminUser)
      admin_root_path
    else
      stored_location_for(resource)
    end
  end
end

