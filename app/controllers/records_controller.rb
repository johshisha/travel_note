require 'RMagick'

class RecordsController < ApplicationController
  before_action :logged_in_user
  before_action :set_record, only: [:show, :edit, :thumbnail, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = current_user.records
    respond_to do |f|
      f.html
      f.json {
        render json: @records.to_json({ except: [:thumbnail] })
      }
    end
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = Record.new
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)
    respond_to do |format|
      if @record.save
        format.html { redirect_to @record, notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def thumbnail
    # http://keruuweb.com/rails-%E7%94%BB%E5%83%8F%E3%82%92%E3%83%80%E3%82%A6%E3%83%B3%E3%83%AD%E3%83%BC%E3%83%89%E3%81%97%E3%81%A6db%E3%81%AB%E6%A0%BC%E7%B4%8D%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95/
    # http://qiita.com/Kaisyou/items/5add9d8b38177c45333c
    # http://d.hatena.ne.jp/kitokitoki/20140525/p1
    send_data @record.thumbnail, type: 'image', disposition: 'inline'
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = current_user.records.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      ret = params.require(:record).permit(:title, :description, :latitude, :longitude, :start_date, :end_date, :url, :image)
      ret[:user_id] = current_user.id
      magick_image = Magick::Image.from_blob(ret[:image].read).shift
      ret.delete(:image)
      size = 150
      ret[:thumbnail] = create_square_image(magick_image, size).to_blob
      ret
    end
end
