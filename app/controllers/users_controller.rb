class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :get_by_id
  # GET
  def show
  end

  # GET
  def edit
  end

  # PUT
  def update
    @user.update_attributes(params[:user])
    redirect_to @user, :notice => t('notice.successfully_updated')
  end

  # GET
  def comments
    @comments = Kaminari.paginate_array(@user.comments).page(params[:page]).per(5)
  end
  # GET
  def favorites
    @favorites = Kaminari.paginate_array(@user.favorites).page(params[:page]).per(5)
  end

  # GET
  def edit_logo
    @image = !@user.logo.blank? ? @user.logo : UserImage.new(:user => @user)
    render :layout => false
  end

  # GET
  def recommends
    baby_age = @user.baby_age || "0-9"
    @generic_items = GenericItem.where(:category_id_by_age =>
      Category.get_categories_by_scope(baby_age, Category::PRINCIPLE_BY_AGE)).
      order("scores desc").page(params[:page]).per(5)
  end

  private
  def get_by_id
    @user = User.find(params[:id])
  end
end
