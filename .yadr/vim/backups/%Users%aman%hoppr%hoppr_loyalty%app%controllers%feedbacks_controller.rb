Vim�UnDo� �@����ѶGŦ��dB^�9��*�7.�c       R    @visit_feedback_summary = Feedback.visit_feedback_summary(session[:outlet_id])   	   Q                      R^�G    _�                        �    ����                                                                                                                                                                                                                                                                                                                                                             RW��     �                �    @feedback  = Feedback.create_and_save(params[:feedback][:questionnaire], params[:feedback][:visit_id], params[:feedback][:user_id], params[:feedback][:merchant_id])5�_�                       �    ����                                                                                                                                                                                                                                                                                                                                                             RW�     �                �    @feedback  = Feedback.create_and_save(params[:feedback][:questionnaire], params[:feedback][:visit_id], params[:feedback][:user_id], params[:feedback][:merchant_id], params[:feedback])5�_�                    	   N    ����                                                                                                                                                                                                                                                                                                                                                             RW��    �      
          O    @visit_feedback_summary = Feedback.visit_feedback_summary(current_merchant)5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             RWج    �                   1class FeedbacksController < ApplicationController   C  before_filter :authenticate_merchant!, except: [:create, :update]   =  before_filter :merchant_outlet?, except: [:create, :update]     load_and_authorize_resource   %  skip_load_resource :only => :create   *  skip_authorize_resource :only => :create         def index   R    @visit_feedback_summary = Feedback.visit_feedback_summary(session[:outlet_id])           respond_to do |format|         format.html       end     end         def create   �    @feedback  = Feedback.create_and_save(params[:feedback][:questionnaire], params[:feedback][:visit_id], params[:feedback][:user_id], params[:feedback][:merchant_id], params[:feedback][:place_id])   ?    #TODO Need to handle same user and current user id scenario       respond_to do |format|   U      format.json { render json: ["Your Feedback has been received !"], status: :ok }       end     end         def update   5    @feedback = Feedback.find(params[:feedback][:id])   K    if @feedback.update_attributes(score: params[:feedback][:rating_score])         respond_to do |format|           format.json   	      end       end     end   end5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             R]A�    �                   1class FeedbacksController < ApplicationController   C  before_filter :authenticate_merchant!, except: [:create, :update]   =  before_filter :merchant_outlet?, except: [:create, :update]     load_and_authorize_resource   %  skip_load_resource :only => :create   *  skip_authorize_resource :only => :create         def index   R    @visit_feedback_summary = Feedback.visit_feedback_summary(session[:outlet_id])           respond_to do |format|         format.html       end     end         def create   �    @feedback  = Feedback.create_and_save(params[:feedback][:questionnaire], params[:feedback][:visit_id], params[:feedback][:user_id], params[:feedback][:merchant_id], params[:feedback][:place_id])   ?    #TODO Need to handle same user and current user id scenario       respond_to do |format|   U      format.json { render json: ["Your Feedback has been received !"], status: :ok }       end     end         def update   5    @feedback = Feedback.find(params[:feedback][:id])   K    if @feedback.update_attributes(score: params[:feedback][:rating_score])         respond_to do |format|           format.json   	      end       end     end   end5�_�      	                    ����                                                                                                                                                                                                                                                                                                                                                v       R^i�    �                  def create5�_�      
           	           ����                                                                                                                                                                                                                                                                                                                                                v       R^j�    �                    binding.pry5�_�   	              
   	   Q    ����                                                                                                                                                                                                                                                                                                                                                             R^�    �      
          R    @visit_feedback_summary = Feedback.visit_feedback_summary(session[:outlet_id])5�_�   
                 	       ����                                                                                                                                                                                                                                                                                                                            	          	          v       R^�r    �      
          a    @visit_feedback_summary = Feedback.visit_feedback_summary(session[:outlet_id], params[:page])5�_�                    	   W    ����                                                                                                                                                                                                                                                                                                                            	          	          v       R^�G    �      
          n    @visit_feedback_summary, @fbs = Feedback.visit_feedback_summary("5253dc35da3ba33780000002", params[:page])5�_�                    	   f    ����                                                                                                                                                                                                                                                                                                                            	          	          v       R^��    �      
          k    @visit_feedback_summary, @fbs = Feedback.visit_feedback_summary(session[:outlet_id], params[:page], 10)5�_�                          ����                                                                                                                                                                                                                                                                                                                                                v       R^3    �                �    Feedback.create_and_save(params[:feedback][:questionnaire], params[:feedback][:visit_id], params[:feedback][:user_id], params[:feedback][:merchant_id], params[:feedback][:place_id], params[:feedback][:callback])5�_�                           ����                                                                                                                                                                                                                                                                                                                                                v       R^04    �                �    Feedback.create_and_save(params[:feedback][:questionnaire], params[:feedback][:visit_id], params[:feedback][:user_id], params[:feedback][:merchant_id], params[:feedback][:place_id], params[:feedback][:callback])5��