ActiveAdmin.register Vote do
    permit_params :votable, :voted_by
  end
  