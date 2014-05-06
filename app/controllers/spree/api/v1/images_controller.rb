module Spree
  module Api
    module V1
      class ImagesController < ApplicationController
        respond_to :json

        # GET /image
        def index
          respond_with Spree::CustomImage.all
        end

        def show
          respond_with Spree::CustomImage.find(params[:id])
        end

        def create
          # TODO: need to upate
          respond_with Spree::CustomImage.create(params[:product])
        end

        def update
          # TODO: not needed?
          respond_with Spree::CustomeImage.update(params[:id], params[:product])
        end

        def destroy
          respond_with Spree::CustomeImage.destroy(params[:id])
        end
      end
    end
  end
end
