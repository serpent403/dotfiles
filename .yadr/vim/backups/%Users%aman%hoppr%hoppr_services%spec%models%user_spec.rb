Vim�UnDo� |�E5�d ܃hm)�c�Xu�0�gz��ڐ}�  3   q      Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), user, nil).and_return('price_point')  �   V                       R��    _�                     �   U    ����                                                                                                                                                                                                                                                                                                                                                             R�    �   �   �                source = �   �   �  2      U      user = FactoryGirl.create :user, telco: "airtel", mobile_number: "919872484122"5�_�                    �   �    ����                                                                                                                                                                                                                                                                                                                                                             R�    �   �   �  3      �      QueueService.should_receive(:enqueue_for_charging).with(user.id, coupon: JSON.parse(coupon.as_document.to_json), fallback: 'true')  { |*args| original_method.call *args }5�_�                    �   &    ����                                                                                                                                                                                                                                                                                                                                                             R��    �   �   �  3      '      user.charge_with_fallback(coupon)5�_�                   �   T    ����                                                                                                                                                                                                                                                                                                                                                             R��    �  �  �  3      o        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user).and_return("price-point")5�_�                   �   T    ����                                                                                                                                                                                                                                                                                                                                                             R��    �  �  �  3      o        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user).and_return("price-point")5�_�                   �   V    ����                                                                                                                                                                                                                                                                                                                                                             R��   	 �  �  �  3      q          Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user).and_return('price_point')5�_�                   �   V    ����                                                                                                                                                                                                                                                                                                                                                             R��   
 �  �  �  3      i          Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user).and_return(false)5�_�      	             �   T    ����                                                                                                                                                                                                                                                                                                                                                             R��    �  �  �  3      o        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user).and_return("price-point")5�_�      
           	      T    ����                                                                                                                                                                                                                                                                                                                                                             R�    �  �    3      o        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user).and_return("price-point")5�_�   	              
     V    ����                                                                                                                                                                                                                                                                                                                                                             R�    �      3      q          Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user).and_return('price_point')5�_�   
                   V    ����                                                                                                                                                                                                                                                                                                                                                             R�    �      3      i          Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user).and_return(false)5�_�                   )   T    ����                                                                                                                                                                                                                                                                                                                                                             R�    �  (  *  3      o        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user).and_return("price-point")5�_�                   6   T    ����                                                                                                                                                                                                                                                                                                                                                             R�    �  5  7  3      o        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user).and_return("price-point")5�_�                   �   Q    ����                                                                                                                                                                                                                                                                                                                                                             R�    �  �  �  3      l      Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), user).and_return('price_point')5�_�                   �   Y    ����                                                                                                                                                                                                                                                                                                                                                             R�p    �  �  �  3      t        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user, nil).and_return("price-point")5�_�                   �   Y    ����                                                                                                                                                                                                                                                                                                                                                             R��    �  �  �  3      t        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user, nil).and_return("price-point")5�_�                   �   [    ����                                                                                                                                                                                                                                                                                                                                                             R��     �  �  �  3      v          Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user, nil).and_return('price_point')5�_�                   �   [    ����                                                                                                                                                                                                                                                                                                                                                             R��     �  �  �  3      n          Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user, nil).and_return(false)5�_�                   �   Y    ����                                                                                                                                                                                                                                                                                                                                                             R��     �  �  �  3      t        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user, nil).and_return("price-point")5�_�                       Y    ����                                                                                                                                                                                                                                                                                                                                                             R��     �  �    3      t        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user, nil).and_return("price-point")5�_�                      [    ����                                                                                                                                                                                                                                                                                                                                                             R��     �      3      v          Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user, nil).and_return('price_point')5�_�                      [    ����                                                                                                                                                                                                                                                                                                                                                             R��     �      3      n          Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user, nil).and_return(false)5�_�                   )   Y    ����                                                                                                                                                                                                                                                                                                                                                             R��     �  (  *  3      t        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user, nil).and_return("price-point")5�_�                   6   Y    ����                                                                                                                                                                                                                                                                                                                                                             R��    �  5  7  3      t        Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), @user, nil).and_return("price-point")5�_�                    �   V    ����                                                                                                                                                                                                                                                                                                                                                             R��    �  �  �  3      q      Telco.any_instance.should_receive(:deduct_later).with(kind_of(Coupon), user, nil).and_return('price_point')5��