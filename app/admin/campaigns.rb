ActiveAdmin.register Campaign do
  form do |f|
    f.inputs "Campaigns" do
      f.inputs "Active Pixels" do
        f.input :pixels, :as => :check_boxes
      end
      f.input :name
      f.input :ref
    end
    f.buttons
  end
  
end
