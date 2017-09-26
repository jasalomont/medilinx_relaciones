ActiveAdmin.register BrokerProfile do

 permit_params :phone_work, :address_work, :city_work, :zip_work, :state_work, :country_work, :phone_mobile, :practice_name, :company, :insurer_id, :photo, :job_title

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


end
