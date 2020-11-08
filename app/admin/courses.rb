ActiveAdmin.register Course do
  permit_params :title, :description, :tags, :category_id
end
