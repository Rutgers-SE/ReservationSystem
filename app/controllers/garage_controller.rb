class GarageController < ApplicationController
   
   
   # a fake function that will emulate a garage that has space 
   def full
       render json: true
   end
   
   def reserve
      
      # this is a valid image.
      render json: {
         message: "Everything is alright."
      }
   end
    
end