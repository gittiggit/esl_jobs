ActiveAdmin.register JobPost do
 permit_params :title, :description, :jobslink, :salary, :company
 controller do
  defaults :finder => :find_by_slug
 end
 
 index do  
    column :title
    column :salary
    column :jobslink
    column :country
    default_actions
  end  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
