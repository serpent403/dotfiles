Vim�UnDo� _���CO��V��eaS�hJ�Dl╻5s��l                                     Ro�u    _�                     	   )    ����                                                                                                                                                                                                                                                                                                                                                             Rş    �               )  def perform_sync object, operation_type5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             R�@     �                     �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             R�H    �             �                	      pry5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             R��     �                       require 'pry'; binding.pry5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             R��     �                      5�_�                    
       ����                                                                                                                                                                                                                                                                                                                                                             R��   
 �   	   
              binding.pry5�_�                    	   )    ����                                                                                                                                                                                                                                                                                                                                                             Ro��     �               )  def perform_sync object, operation_type5�_�      	              
        ����                                                                                                                                                                                                                                                                                                                                                             Ro��    �   
          �   	                 pry5�_�      
           	   
       ����                                                                                                                                                                                                                                                                                                                               
                 v       Ro��     �   	   
              require 'pry'; binding.pry5�_�   	              
   
       ����                                                                                                                                                                                                                                                                                                                               
                 v       Ro��    �   	   
              5�_�   
                         ����                                                                                                                                                                                                                                                                                                                               
                 v       Ro��     �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                               
                 v       Ro��    �                 end5�_�                             ����                                                                                                                                                                                                                                                                                                                               
                 v       Ro�t     �                  module Syncable     extend ActiveSupport::Concern     included do       before_create do |object|   #      perform_sync object, "create"       end     end       )  def perform_sync object, operation_type   I    Rails.logger.info "attempting sync #{object._type} #{object.to_json}"       if object.class == Place   �      additional_attributes = {"merchant_id" => object.merchant_id,"offer_id" => object.offer_id, "high_focus_area_id" => object.high_focus_area_id}   �      SyncService.new.process(sync_uri, { record: JSON.parse(object.as_document.to_json), class_name: self.class.name, operation_type: operation_type, sync_to_services: object.sync_to_services, additional_attributes: additional_attributes  }) if do_sync?       else   �      SyncService.new.process(sync_uri, { record: JSON.parse(object.as_document.to_json), class_name: self.class.name, operation_type: operation_type, sync_to_services: "false" }) if do_sync?       end     end         def do_sync?       true     end         def sync_uri       "sync/record"     end   end5��