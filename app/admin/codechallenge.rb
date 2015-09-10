ActiveAdmin.register Codechallenge do

  index do
    column :name
    column :description
    column :background
    column :problem
    column :attempts_number
    column :solution
    default_actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end