class MenusController < ApplicationController
  
  
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.user_id = current_user.id
    if @menu.save
      redirect_to menu_path(@menu), notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def edit
    @menu = Menu.find(params[:id])
    if @menu.user != current_user
      redirect_to menus_path, alert: '不正なアクセスです。'
    end
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(menu_params)
      redirect_to menu_path(@menu), notice: '更新に成功しました。'
    else
      render :edit
    end
  end
  
  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to menus_path
  end

  private
  def menu_params
    params.require(:menu).permit(:title, :body, :image)
  end

end
