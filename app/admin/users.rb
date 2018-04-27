ActiveAdmin.register User do
  index do
    selectable_column
    column :name
    column :univ
    column :dev do |obj|
      obj.dev.each do |label|
        # label
        status_tag label
      end
      nil
    end
    column :theme do |obj|
      obj.theme.each do |label|
        # label
        status_tag label
      end
      nil
    end
    column :position
    # actions
  end
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
