Vim�UnDo� 粘cj������ʐ��-�.۾Sρ�,�G8ϑ                                     Q�k;    _�                       !    ����                                                                                                                                                                                                                                                                                                                                                             Q�D�    �               !  def perform user, service="hop"5�_�                    	       ����                                                                                                                                                                                                                                                                                                                                                             Q�H&    �   	                   binding.p[�                   else5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q�J�    �                   if user.nil?5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             Q�L;    �                   end5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             Q�k:     �                  Sclass Receptionist::Operations::Registration < Receptionist::Operations::Operations   !  def perform user, service="hop"       binding.pry   /    replies = Receptionist::Models::Replies.new       if user.nil?         binding.pry   P      new_user = Receptionist::Clients::Api.new.register_user(@incoming_message)   *      user     = acquire new_user, service   ^      replies.add_cli Receptionist::Models::Scripts.t('registration.new_user', nil, nil), :sms       else         binding.pry   A      if user['service'].nil? || !user['service'].include?('hop')   $        user = acquire user, service   
      else   n        # Receptionist::Clients::Api.new.register_user_activity(user["_id"], @incoming_message.sanitized_text)   	      end   F      replies.add_cli get_registered_user_message(user['telco']), :sms       end       binding.pry       return replies, user     end       '  def get_registered_user_message telco   �    return Receptionist::Models::Scripts.t('registration.already_present_location', nil, nil) if Receptionist::Models::Locator.is_location_available telco   T    return Receptionist::Models::Scripts.t('registration.already_present', nil, nil)     end   end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             Q�D�     �               "  def perform user, service="hopo"5�_�                        "    ����                                                                                                                                                                                                                                                                                                                                                             Q�D�     �               "  def perform user, service="hopo"    5��