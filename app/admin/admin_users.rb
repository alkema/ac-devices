ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  action_item :invitation do
    link_to 'Invite Admin User', invitation_admin_admin_users_path
  end

  collection_action :invitation do
    @invitation = Invitation.new
  end

  collection_action :invite, method: :post do
    @invitation = Invitation.new(params.require(:invitation).permit(:email))

    if @invitation.valid?
      flash[:notice] = "Invitation sent to #{@invitation.email}"

      AdminUser.invite!(email: @invitation.email)

      redirect_to admin_admin_users_path
    else
      flash[:error] = "Please enter valid email"

      redirect_to invitation_admin_admin_users_path
    end

  end

end
