ActiveAdmin.register User do

  permit_params :company_id, :employeeID, :name, :email, :phone_number, :role_id, :backend_admin, :setup, :image, :department_id
  actions :all, except: [:destroy]

  index do
    column :id
    column :name
    column :email
    column :phone_number
    column :role
    column :company
    column :department
    column :points_available
    column :setup
    actions
  end

  show do |u|
    attributes_table do
      row :name
      row :email
      row :phone_number
      row :role
      row :company
      row :department
      row :points_available
      row :image do
        image_tag(u.image.thumb('300x200#').url) if u.image_stored?
      end
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :phone_number
      f.input :role
      f.input :company  
      f.input :department    
      f.input :setup
      f.input :image, :as => :file
    end
    f.actions
  end
  
end



