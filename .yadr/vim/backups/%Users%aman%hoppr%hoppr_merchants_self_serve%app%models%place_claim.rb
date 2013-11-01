Vim�UnDo� g.�%��uZ~���R�A	'A�&���c{"�;�  [       F                           Qʛu    _�                     0        ����                                                                                                                                                                                                                                                                                                                                                             Q�7�     �   /   2  V       5�_�                    <   1    ����                                                                                                                                                                                                                                                                                                                                                             Q�7�     �   ;   >  W      1  validate :validate_place_latitude_and_longitude5�_�                    @        ����                                                                                                                                                                                                                                                                                                                                                             Q�7�     �   ?   A  X       5�_�                    D        ����                                                                                                                                                                                                                                                                                                                                                             Q�7�     �   C   F  X       5�_�                    D        ����                                                                                                                                                                                                                                                                                                                                                             Q�7�    �   C   E  Y       5�_�                    1        ����                                                                                                                                                                                                                                                                                                                                                             Q�H7     �              Y   class PlaceClaim     include Mongoid::Document     include Mongoid::Timestamps     PENDING = "Pending".freeze     VERIFIED = "Verified".freeze     DECLINED = "Declined".freeze       (  STATUS = [PENDING, VERIFIED, DECLINED]   �  VERIFICATION_REQUIRED_FOR = [:place_address, :place_locality, :place_pin, :place_city, :place_latitude, :place_longitude, :place_document]     #ira merchant   )  field :ira_merchant_id, :type => String         #claim checking specific   0  field :start_time_of_contact, :type => Integer   .  field :end_time_of_contact, :type => Integer   5  field :status, :type => String, :default => PENDING         #place details   "  field :place_id, :type => String   $  field :place_name, :type => String   +  field :products_services, :type => String   (  field :place_category, :type => String   '  field :place_address, :type => String   (  field :place_locality, :type => String   #  field :place_hfa, :type => String   (  field :place_landmark, :type => String   $  field :place_city, :type => String   (  field :place_latitude, :type => String   )  field :place_longitude, :type => String   #  field :place_pin, :type => String   .  field :place_contact_number, :type => String   '  field :place_website, :type => String   %  field :place_email, :type => String   %  field :place_image, :type => String   (  field :place_document, :type => String   (  field :admin_comments, :type => String   '  field :place_keyword, :type => String   (  field :changed_fields, :type => String   :  field :doc_verified, :type => Boolean, :default => false   ;  field :tele_verified, :type => Boolean, :default => false         belongs_to :user     belongs_to :member     has_many :place_offers   !  has_and_belongs_to_many :offers       ?  attr_accessor :place_category_name, :hfa_name, :merchant_name       =begin   2  validates_presence_of :ira_merchant_id, :user_id   �  validates_presence_of :place_name, :place_category, :products_services, :place_address, :place_locality, :place_city, :place_pin, :place_contact_number, :place_email   O  validates_presence_of :place_document, :message => "Please attach a document"       q  validates :place_pin, :length => { :is => 6 }, :numericality => { :only_integer => true }, :allow_blank => true   _  validates :place_email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }   g  validates :place_contact_number, :length => { :is => 10 }, :numericality => { :only_integer => true }   Z  validates :place_latitude, :place_longitude, :numericality => true, :allow_blank => true   e  validates :place_keyword, :uniqueness => true, :if => Proc.new{|place| !place.place_keyword.blank?}     validate :ira_merchant_valid   1  validate :validate_place_latitude_and_longitude   =end   !  before_save :update_hoppr_place      after_save :sent_status_mailer   =begin   �  validates :start_time_of_contact, :inclusion => { :in => 9..18 }, :numericality => { :only_integer => true }, :allow_blank => true   �  validates :end_time_of_contact, :inclusion => { :in => 10..19 }, :numericality => { :only_integer => true }, :allow_blank => true   +  validate :validate_start_end_contact_time   =end         def merchant   B    Merchant.where(:ira_merchant_id => self.ira_merchant_id).first     end         def included_offers   =    Offer.where(:_id.in => self.place_offers.map(&:offer_id))     end       +  def validate_place_latitude_and_longitude   �    self.errors.add(:place_latitude,I18n.t("system.place_claim.errors.no_value")) if self.verified? && self.place_latitude.blank?   �    self.errors.add(:place_longitude,I18n.t("system.place_claim.errors.no_value")) if self.verified? && self.place_longitude.blank?     end       %  def validate_start_end_contact_time   L    if self.start_time_of_contact.blank? and self.end_time_of_contact.blank?         return       end   M    if self.start_time_of_contact.blank? and !self.end_time_of_contact.blank?   j      self.errors.add(:start_time_of_contact, I18n.t("system.place_claim.errors.start_time_select_error"))         return       end   M    if !self.start_time_of_contact.blank? and self.end_time_of_contact.blank?   f      self.errors.add(:end_time_of_contact, I18n.t("system.place_claim.errors.end_time_select_error"))         return       end   F    if !(self.end_time_of_contact >= (self.start_time_of_contact + 1))   f      self.errors.add(:end_time_of_contact, I18n.t("system.place_claim.errors.end_time_select_error"))         return       end     end         def ira_merchant_valid   +    if !self.new_record? and self.verified?   %      api_client = HopprAppClient.new       ,      ira_merchant_id = self.ira_merchant_id   H      ira_merchant_params = api_client.get_merchant self.ira_merchant_id       !      if ira_merchant_params.nil?   _        self.errors.add(:merchant_name, I18n.t("system.place_claim.errors.merchant_not_found"))           return   	      end       /      if !Merchant.active?(ira_merchant_params)   b        self.errors.add(:merchant_name, I18n.t("system.place_claim.errors.merchant_not_verified"))           return   	      end       end     end         def ira_place_valid   +    if !self.new_record? and self.verified?   %      api_client = HopprAppClient.new       ;      place_params = api_client.get_place self.place_id, ""             if place_params.nil?   Y        self.errors.add(:place_name, I18n.t("system.place_claim.errors.place_not_found"))   	      end       end     end         def verified?       self.status == VERIFIED     end         def pending?       self.status == PENDING     end         def declined?       self.status == DECLINED     end         def place_category_name   R    ira_place_category = HopprAppClient.new.get_place_category self.place_category   T    ira_place_category.nil? ? "category missing in ira" : ira_place_category["name"]     end         def hfa_name   &    return "" if self.place_hfa.blank?   C    ira_hfa = HopprAppClient.new.get_high_focus_area self.place_hfa   F    ira_hfa.nil? ? "high focus area missing in ira"  : ira_hfa["name"]     end         def merchant_name   �    self.user && self.user.merchant_id.present? ? Merchant.merchant_name( self.ira_merchant_id) : "place not associated with merchant"     end       ,  def self.get_keyword(place_id,merchant_id)   >    place = HopprAppClient.new.get_place(place_id,merchant_id)   )    !place.blank? ? place["keyword"] : ""     end         def sent_status_mailer   T    if self.valid? and !self.new_record? and !self.pending? and self.status_changed?   4      PlaceClaimMailer.inform_merchant(self).deliver       end     end       $  def self.populate_from_place place   M    place["tags"] = place["tags"].join(', ') if place["tags"].kind_of?(Array)   &    place["tags"] = place["tags"].to_s       PlaceClaim.new(          :place_id => place["_id"],   #      :place_name => place["name"],   *      :products_services => place["tags"],   4      :place_category => place["place_category_id"],   )      :place_keyword => place["keyword"],   )      :place_address => place["address"],   1      :place_hfa =>  place["high_focus_area_id"],   +      :place_landmark => place["landmark"],   #      :place_city => place["city"],   +      :place_latitude => place["latitude"],   -      :place_longitude => place["longitude"],   !      :place_pin => place["pin"],   7      :place_contact_number => place["contact_number"],   +      :place_locality => place["locality"],   )      :place_website => place["website"],   %      :place_email => place["email"])     end         def update_hoppr_place   #    api_client = HopprAppClient.new       if self         update_ira = false         ira_merchant_id = ""             if self.verified?   .        ira_merchant_id = self.ira_merchant_id   J        ira_merchant_params = api_client.get_merchant self.ira_merchant_id       #        if ira_merchant_params.nil?   a          self.errors.add(:merchant_name, I18n.t("system.place_claim.errors.merchant_not_found"))           return   	      end       .      if Merchant.active?(ira_merchant_params)           update_ira = true   
      else   b        self.errors.add(:merchant_name, I18n.t("system.place_claim.errors.merchant_not_verified"))           return   	      end       end   [    if (self.status_was.eql?(DECLINED) or self.status_was.eql?(PENDING)) and self.verified?         update_ira = true       end   �    api_client.update_place_with_params({"_id" => self.place_id, :merchant_id => ira_merchant_id}) if self.status_was.eql?(VERIFIED) and (self.pending? or self.declined?)       if update_ira   4      if (self.place_id == "" or self.place_id.nil?)           place_params = {   #          :name => self.place_name,   *          :tags => self.products_services,   +          :latitude => self.place_latitude,   -          :longitude => self.place_longitude,   -          :high_focus_area => self.place_hfa,   7          :contact_number => self.place_contact_number,   1          :place_category => self.place_category,   +          :locality => self.place_locality,   )          :address => self.place_address,   +          :landmark => self.place_landmark,   #          :city => self.place_city,   !          :pin => self.place_pin,   )          :website => self.place_website,   %          :email => self.place_email,   )          :temp_path => self.place_image,   0          :document_path => self.place_document,   *          :merchant_id => ira_merchant_id,   (          :keyword => self.place_keyword   	        }   N        response = api_client.create_place_with_params(:place => place_params)   6        if (!response.nil?) and response.status != 201   ]          self.errors.add(:place_name, I18n.t("system.place_claim.errors.place_not_updated"))   �          self.errors.add(:place_keyword, JSON.parse(response.body)["keyword"].to_s) if JSON.parse(response.body).include?("keyword")             return false           else   +          place = JSON.parse(response.body)   &          self.place_id = place["_id"]           end   
      else   9        response = api_client.get_place self.place_id, ""               if response.nil?   [          self.errors.add(:place_name, I18n.t("system.place_claim.errors.place_not_found"))             return false           else             place_params = {}   -          place_params["_id"] = self.place_id   8          place_params["latitude"] = self.place_latitude   :          place_params["longitude"] = self.place_longitude   =          place_params["high_focus_area_id"] = self.place_hfa   D          place_params["contact_number"] = self.place_contact_number   A          place_params["place_category_id"] = self.place_category   8          place_params["locality"] = self.place_locality   6          place_params["address"] = self.place_address   8          place_params["landmark"] = self.place_landmark   0          place_params["city"] = self.place_city   .          place_params["pin"] = self.place_pin   6          place_params["website"] = self.place_website   2          place_params["email"] = self.place_email   7          place_params["merchant_id"] = ira_merchant_id   7          place_params["tags"] = self.products_services   6          place_params["temp_path"] = self.place_image   =          place_params["document_path"] = self.place_document   6          place_params["keyword"] = self.place_keyword   B          place = api_client.update_place_with_params place_params              if place.status != 204   _            self.errors.add(:place_name, I18n.t("system.place_claim.errors.place_not_updated"))   �            self.errors.add(:place_keyword, JSON.parse(place.body)["keyword"].to_s) if JSON.parse(place.body).include?("keyword")               return false             end           end   	      end       end     end       )  rescue Faraday::Error::ConnectionFailed   G    self.errors.add(:place_name, I18n.t("system.ira.connection_error"))       return false     end         def self.search(params)       # merchant id param   K    merchant_id = params[:merchant_id].present? ? params[:merchant_id] : ""           # date range params   K    place_claim = params[:place_claim].present? ? params[:place_claim] : {}   �    start_date = place_claim[:start_date].present? ? DateTime.strptime(place_claim[:start_date], "%m/%d/%Y").beginning_of_day : (DateTime.now - 10.years)   �    end_date = place_claim[:end_date].present? ? DateTime.strptime(place_claim[:end_date], "%m/%d/%Y").end_of_day : DateTime.now.end_of_day           # status param   i    status = params[:status].nil? || params[:status].eql?('All') ? PlaceClaim::STATUS : [params[:status]]           # search query   $    if params[:merchant_id].present?   �      PlaceClaim.any_in(:status => status).and(:ira_merchant_id => merchant_id).and( :created_at => { :$gte => start_date, :$lte  => end_date } )       else   l      PlaceClaim.any_in(:status => status).and( :created_at => { :$gte => start_date, :$lte  => end_date } )       end     end       8  def self.update_place_and_place_claim(place_id,params)   ?    place_claim = PlaceClaim.where(:place_id => place_id).first   5    place = HopprAppClient.new.get_place place_id, ""       if !place_claim   1      new_claim = self.populate_from_place(place)   P      new_claim.products_services =  "products_services" if place["tags"].blank?   *      new_claim.user_id = params[:user].id   :      new_claim.ira_merchant_id = params[:ira_merchant_id]   #      new_claim.attributes = params   W      new_claim.status = self.verification_required?(place,params) ? PENDING : VERIFIED         new_claim.save         if !new_claim.verified?   G        PlaceClaimMailer.inform_admin(new_claim, params[:user]).deliver   	      end         return new_claim       else   %      place_claim.attributes = params   $      changed_fields_and_values = []   .      VERIFICATION_REQUIRED_FOR.each do|field|   �        changed_fields_and_values << "#{field.to_s.gsub("place_","")}:"+ params["#{field.to_sym}"].to_s if place_claim.send("#{field}_changed?")   	      end   F      place_claim.changed_fields = changed_fields_and_values.join(";")   Y      place_claim.status = self.verification_required?(place,params) ? PENDING : VERIFIED         place_claim.update   '      [place_claim, place_claim.errors]       end     end       /  def self.verification_required?(place,params)   �    (place["address"] != params[:place_address] || place["city"] != params[:place_city] || place["locality"] != params[:place_locality] ||    �    place["pin"].to_s != params[:place_pin].to_s || place["latitude"].to_s != params[:place_latitude] && !params[:place_latitude].blank? || place["longitude"].to_s != params[:place_longitude] && !params[:place_longitude].blank? ||   Y    place["document_path"] != params[:place_document] && !params[:place_document].blank?)     end       end5�_�                    1        ����                                                                                                                                                                                                                                                                                                                                                             Qʛd     �   0   3  V      2  validates_presence_of :ira_merchant_id, :user_id5�_�      	              1        ����                                                                                                                                                                                                                                                                                                                                                             Qʛe     �   0   2  W       5�_�      
           	   <   1    ����                                                                                                                                                                                                                                                                                                                                                             Qʛj     �   ;   ?  W      1  validate :validate_place_latitude_and_longitude5�_�   	              
   B        ����                                                                                                                                                                                                                                                                                                                                                             Qʛo     �   A   D  Y      �  validates :start_time_of_contact, :inclusion => { :in => 9..18 }, :numericality => { :only_integer => true }, :allow_blank => true5�_�   
                 B        ����                                                                                                                                                                                                                                                                                                                                                             Qʛp     �   A   C  Z       5�_�                    F        ����                                                                                                                                                                                                                                                                                                                                                             Qʛs     �   E   H  Z       5�_�                     F        ����                                                                                                                                                                                                                                                                                                                                                             Qʛt    �   E   G  [       5��