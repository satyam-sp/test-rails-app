ActiveAdmin.register User do
  actions  :index
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :updated_at
    actions do |user|
      item((user.disabled ? 'enable' : 'disable'), disable_admin_user_path(user.id), class: 'member_link') 
    end
  end

  member_action :disable, method: :get do
    user = User.find(params[:id])
    user.update(disabled: !user.disabled)
    redirect_to admin_users_path, notice: 'User disabled successfully.'
  end
end
