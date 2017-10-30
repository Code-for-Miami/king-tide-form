ActiveAdmin.register Attachment do
  permit_params :upload_file_name, :upload_file_type, :upload_file_size
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
    selectable_column
    id_column
    column 'Flood' do |attachment|
      # if attachment.present?
        link_to(attachment.flood_id, admin_flood_path(attachment.flood_id)) 
        # end
  end
    column :upload_file_name
    column :upload_file_type
    column :upload_file_size
    column 'Attachment URL' do |attachment|
      if attachment.present?
  		full_file_path = attachment.upload.url
        link_to(full_file_path.to_s, full_file_path.to_s) 
        end
      
    	

      	end
	end
end
