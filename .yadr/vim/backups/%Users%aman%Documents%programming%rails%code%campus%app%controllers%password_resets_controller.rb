Vim�UnDo� �ڙ�s/��M3�L�
 ]B�r>(z>���       /  layout "simple", only: [:new, :create, :edit]      /      H       H   H   H    R!�   < _�                            ����                                                                                                                                                                                                                                                                                                                                                 v       Rn-     �             �                 end5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v       Rn4     �                    user = User.where(�                 def create5�_�                           ����                                                                                                                                                                                                                                                                                                                            	           	          v       Rn;     �         	          user = User.where()5�_�                           ����                                                                                                                                                                                                                                                                                                                            	           	          v       Rn=    �         	           user = User.where(email:" ")5�_�                       ,    ����                                                                                                                                                                                                                                                                                                                            	           	          v       RnV     �                    UserMailer.password_reset(�         	      ,    user = User.where(email: params[:email])5�_�                       #    ����                                                                                                                                                                                                                                                                                                                            
           
          v       Rna     �      	          "    redirect_to root_url, notice: �      	   
      #    UserMailer.password_reset(user)5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                 v       Rn�    �      	         $    redirect_to root_url, notice: ""5�_�      	              	        ����                                                                                                                                                                                                                                                                                                                                                 v       Rn�    �      	           5�_�                 	      +    ����                                                                                                                                                                                                                                                                                                                            
           
          v       Ro�    �         
      <    UserMailer.password_reset(user).deliver if user.present?5�_�   	      
             ,    ����                                                                                                                                                                                                                                                                                                                            
           
          v       Rs�    �         
      ,    user = User.where(email: params[:email])5�_�                    	       ����                                                                                                                                                                                                                                                                                                                            
           
          v       Ruy   	 �             �         
        end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v       Ru�     �                 5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v       Ru�     �   
             
  def edit5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v       Ru�     �   
               end5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                 v       Ru�     �   	             5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v       Ru�     �   
              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                 v        Ru�   
 �                end�                  end�                    render :edit�                  else�                ?    redirect_to root_url, :notice => "Password has been reset!"�                .  elsif @user.update_attributes(params[:user])�                P    redirect_to new_password_reset_path, :alert => "Password reset has expired."�                /  if @user.password_reset_sent_at < 2.hours.ago�                9  @user = User.find_by_password_reset_token!(params[:id])�                
def update�                end�                9  @user = User.find_by_password_reset_token!(params[:id])�   
             def edit5�_�                       /    ����                                                                                                                                                                                                                                                                                                                                                 v        Ru�     �               ;    @user = User.find_by_password_reset_token!(params[:id])5�_�                       .    ����                                                                                                                                                                                                                                                                                                                                                 v        Ru�     �               ;    @user = User.find_by_password_reset_token! params[:id])5�_�                       -    ����                                                                                                                                                                                                                                                                                                                                                 v        Ru�     �               :    @user = User.find_by_password_reset_token params[:id])5�_�                           ����                                                                                                                                                                                                                                                                                                                                                 v        Ru�    �               ;    @user = User.find_by_password_reset_token: params[:id])5�_�                       ;    ����                                                                                                                                                                                                                                                                                                                                                V       Ru�     �               ;    @user = User.find_by_password_reset_token!(params[:id])5�_�                       )    ����                                                                                                                                                                                                                                                                                                                                                V       Ru�     �               9    @user = User.where(password_reset_token: params[:id])       �                   �             �               )    @user = User.find_by_password_reset_t5�_�                       =    ����                                                                                                                                                                                                                                                                                                                                                V       Ru�    �               =    @user = User.where(password_reset_token: params[:id])    5�_�                       Q    ����                                                                                                                                                                                                                                                                                                                                                V       Ru�    �               R      redirect_to new_password_reset_path, :alert => "Password reset has expired."5�_�                      9    ����                                                                                                                                                                                                                                                                                                                                                V       Rv�     �               9    @user = User.where(password_reset_token: params[:id])5�_�                       9    ����                                                                                                                                                                                                                                                                                                                                                V       Rv�    �               9    @user = User.where(password_reset_token: params[:id])5�_�                             ����                                                                                                                                                                                                                                                                                                                               &          ,       v   ,    R��     �                  def update5�_�      !                       ����                                                                                                                                                                                                                                                                                                                               &          ,       v   ,    R��     �                  # def update5�_�       "           !           ����                                                                                                                                                                                                                                                                                                                               &          ,       v   ,    R��     �                ?    @user = User.where(password_reset_token: params[:id]).first5�_�   !   #           "           ����                                                                                                                                                                                                                                                                                                                               &          ,       v   ,    R��     �                A    # @user = User.where(password_reset_token: params[:id]).first5�_�   "   $           #      1    ����                                                                                                                                                                                                                                                                                                                               &          ,       v   ,    R�     �               1    if @user.password_reset_sent_at < 2.hours.ago5�_�   #   %           $          ����                                                                                                                                                                                                                                                                                                                               &          ,       v   ,    R�*     �                   if @user.token_expired?()5�_�   $   '           %          ����                                                                                                                                                                                                                                                                                                                               &          ,       v   ,    R�1    �               1    if @user.token_expired?(password_reset_token)5�_�   %   (   &       '      6    ����                                                                                                                                                                                                                                                                                                                                                             R�@     �                	  layout �                6class PasswordResetsController < ApplicationController5�_�   '   )           (          ����                                                                                                                                                                                                                                                                                                                                                             R�c     �                 layout "simple"5�_�   (   *           )          ����                                                                                                                                                                                                                                                                                                                                                             R�h    �                 layout "simple", only: []5�_�   )   +           *      %    ����                                                                                                                                                                                                                                                                                                                                                             R�m     �               &  layout "simple", only: [:new. :edit]5�_�   *   ,           +      &    ����                                                                                                                                                                                                                                                                                                                                                             R�o     �               &  layout "simple", only: [:new. :edit]5�_�   +   -           ,          ����                                                                                                                                                                                                                                                                                                                                                             R�t    �               &  layout "simple", only: [:new. :edit]5�_�   ,   /           -          ����                                                                                                                                                                                                                                                                                                                                                             R��   $ �               A      redirect_to root_url, :notice => "Password has been reset!"5�_�   -   1   .       /   
       ����                                                                                                                                                                                                                                                                                                                                                             R �m   ) �   	            P    redirect_to root_url, notice: "Email sent with password reset instructions."5�_�   /   2   0       1      2    ����                                                                                                                                                                                                                                                                                                                                                             R ȑ     �      
         2    user = User.where(email: params[:email]).first5�_�   1   3           2   
        ����                                                                                                                                                                                                                                                                                                                                                             R Ș     �   	            -    user.send_password_reset if user.present?5�_�   2   4           3          ����                                                                                                                                                                                                                                                                                                                                                             R Ș     �   
            S    redirect_to log_in_path, notice: "Email sent with password reset instructions."5�_�   3   5           4      U    ����                                                                                                                                                                                                                                                                                                                                                             R ș     �   
            U      redirect_to log_in_path, notice: "Email sent with password reset instructions."5�_�   4   6           5          ����                                                                                                                                                                                                                                                                                                                                                             R ȝ     �                   else5�_�   5   7           6           ����                                                                                                                                                                                                                                                                                                                                                             R Ȩ   - �                5�_�   6   8           7          ����                                                                                                                                                                                                                                                                                                                                                             R �,     �                S      redirect_to log_in_path, notice: "No account with this email address exists."5�_�   7   9           8          ����                                                                                                                                                                                                                                                                                                                                                             R �.     �                     �                   else5�_�   8   :           9           ����                                                                                                                                                                                                                                                                                                                                                             R �1     �                9            flash.now.alert = "Invalid email or password"5�_�   9   ;           :           ����                                                                                                                                                                                                                                                                                                                                                             R �1     �                8           flash.now.alert = "Invalid email or password"5�_�   :   <           ;           ����                                                                                                                                                                                                                                                                                                                                                             R �1     �                7          flash.now.alert = "Invalid email or password"5�_�   ;   =           <           ����                                                                                                                                                                                                                                                                                                                                                             R �2     �                6         flash.now.alert = "Invalid email or password"5�_�   <   >           =           ����                                                                                                                                                                                                                                                                                                                                                             R �2     �                5        flash.now.alert = "Invalid email or password"5�_�   =   ?           >           ����                                                                                                                                                                                                                                                                                                                                                             R �2   . �                4       flash.now.alert = "Invalid email or password"5�_�   >   @           ?      2    ����                                                                                                                                                                                                                                                                                                                                                             R �4   0 �                3      flash.now.alert = "Invalid email or password"5�_�   ?   A           @           ����                                                                                                                                                                                                                                                                                                                                                             R �R     �                &  layout "simple", only: [:new, :edit]5�_�   @   B           A           ����                                                                                                                                                                                                                                                                                                                                                             R �S   2 �                (  layout "simple", only: [:new, , :edit]5�_�   A   C           B          ����                                                                                                                                                                                                                                                                                                                                                             R �     �      	              if params[�      	            def create5�_�   B   D           C          ����                                                                                                                                                                                                                                                                                                                                                             R �:   3 �         !        def create    �      	   !          if params[:email]5�_�   C   E           D   
   /    ����                                                                                                                                                                                                                                                                                                                                                             R �q   4 �   	             /      user.send_password_reset if user.present?5�_�   D   F           E           ����                                                                                                                                                                                                                                                                                                                                                             R!�     �                   6class PasswordResetsController < ApplicationController   /  layout "simple", only: [:new, :create, :edit]       	  def new     end         def create   2    user = User.where(email: params[:email]).first       if user.present?         user.send_password_reset   U      redirect_to log_in_path, notice: "Email sent with password reset instructions."       else   D      flash.now.alert = "No account with this email address exists."         render "new"       end     end       
  def edit   ?    @user = User.where(password_reset_token: params[:id]).first     end         def update   ?    @user = User.where(password_reset_token: params[:id]).first   2    if @user.token_expired?(:password_reset_token)   d      redirect_to new_password_reset_path, :alert => "Password reset has expired. Please try again."   0    elsif @user.update_attributes(params[:user])   D      redirect_to log_in_path, :notice => "Password has been reset!"       else         render :edit       end     end   end5�_�   E   G           F      B    ����                                                                                                                                                                                                                                                                                                                                                             R!8   5 �                C      redirect_to login_path, :notice => "Password has been reset!"5�_�   F   H           G      K    ����                                                                                                                                                                                                                                                                                                                                                             R!F   : �                h      redirect_to login_path, :notice => "Password has been reset. You can login with the new password."5�_�   G               H      /    ����                                                                                                                                                                                                                                                                                                                                                             R!�   < �                /  layout "simple", only: [:new, :create, :edit]5�_�   /           1   0   	       ����                                                                                                                                                                                                                                                                                                                                                             R ȍ     �      
             usif user.present?5�_�   -           /   .   
       ����                                                                                                                                                                                                                                                                                                                                                             R��     �   	            H    redirect_to , notice: "Email sent with password reset instructions."5�_�   %           '   &      6    ����                                                                                                                                                                                                                                                                                                                                                             R�t     �                6class PasswordResetsController < ApplicationController     �               )  layout "landing", only: [:new, :create]    5�_�                       :    ����                                                                                                                                                                                                                                                                                                                                                V       Rv     �               I      redirect_to root_url, :notice => "Password has been already reset!"5�_�   	             
      ,    ����                                                                                                                                                                                                                                                                                                                            
           
          v       Rr'     �         
          user = User.with_email()5�_�   
                         ����                                                                                                                                                                                                                                                                                                                            
           
          v       Rr,    �         
      *    user = User.with_email(params[:email])5��