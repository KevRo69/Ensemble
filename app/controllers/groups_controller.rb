class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
    @markers = @groups.geocoded.map do |group|
      {
        lat: group.latitude,
        lng: group.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {group: group})
      }
    end
  end

  def show
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    @group.users << current_user
    if @group.save
      redirect_to group_path(@group)
    else
      print @group.errors.full_messages
      print @group.user_id
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :city, :user_id, :photo)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
