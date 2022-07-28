class TransportersController < ApplicationController
    include Common

    private
    
    def model_params
        params.require(:payload).permit(:code, :name, :address, :contact_phone)
    end
end
