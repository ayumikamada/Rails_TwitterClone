class TsubuyakisController < ApplicationController

  before_action :set_tsubuyaki, only: [:edit, :update, :destroy]

  def top
  end

  def index
    @tsubuyakis = Tsubuyaki.all.order(created_at: :desc)
  end

  def new
    @tsubuyaki = Tsubuyaki.new
  end

  def confirm
    @tsubuyaki = Tsubuyaki.new(tsubuyaki_params)
    render :new if @tsubuyaki.invalid?
  end

  def create
    @tsubuyaki = Tsubuyaki.new(tsubuyaki_params)
    if params[:back]
      render :new
    else
      if @tsubuyaki.save
        redirect_to tsubuyakis_path, notice: "投稿完了！"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @tsubuyaki.update(tsubuyaki_params)
      redirect_to tsubuyakis_path, notice: "編集完了！"
    else
      render :edit
    end
  end

  def destroy
    @tsubuyaki.destroy
    redirect_to tsubuyakis_path, notice:"削除完了！"
  end

  private

  def tsubuyaki_params
    params.require(:tsubuyaki).permit(:content)
  end

  def set_tsubuyaki
    @tsubuyaki = Tsubuyaki.find(params[:id])
  end

end
