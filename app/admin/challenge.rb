ActiveAdmin.register Challenge::Challenge do
  menu :label => I18n.t("challenges")
  
  permit_params :name, :description, :code, :tests
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :description, as: :text, :input_html => {:rows => 10}
      f.input :code, as: :text, :input_html => {:rows => 10}
      f.input :tests, as: :text, :input_html => {:rows => 10} 
    end
    f.actions
  end
  
  index do
    column :id
    column :description
    column :number_of_attempts
  end
end
