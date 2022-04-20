class ImagesController < ApplicationController
      def index
        @images = Image.order(created_at: :desc).all.paginate(:page => params[:page], :per_page => 2)
      end
    
      def show
        @image = Image.find(params[:id])
      end
    
      def new
        @image = Image.new
      end
    
      def create
        @image = Image.new(image_params)

        respond_to do |format|
          if @image.save
            format.html { redirect_to images_url }
            format.json { head :no_content }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @image.errors, status: :unprocessable_entity }
            format.turbo_stream { render :form_update, status: :unprocessable_entity }
          end
        end
      end
    
    
      private
      def image_params
        params.require(:image).permit(:image, :description)
      end
end
