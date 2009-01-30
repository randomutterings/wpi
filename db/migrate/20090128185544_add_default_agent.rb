class AddDefaultAgent < ActiveRecord::Migration
  def self.up
    Agent.create(:first_name => "Jennifer",
                 :last_name => "Dwyer",
                 :address1 => "P.O. Box 8013",
                 :address2 => "",
                 :city => "Rocky Mount",
                 :state => "NC",
                 :zip => "27804",
                 :county => "Nash",
                 :phone => "252-266-7083",
                 :fax => "252-822-0152",
                 :tollfree => "",
                 :email => "jendwyer@email.com",
                 :description => "Your home is one of the greatest negotiations of your life. Mistakes can be extremely costly. How good is the agent representing YOU at the negotiating table?

                 As your agent, my goal is to provide home sellers and buyers with an innovative real estate solution. 

                 At World Properties International, we have streamlined the real estate process and are able to pass significant savings on to our clients.

                 As your agent I am commited to creating an enjoyable, convenient, and affordable home buying and selling experience by providing innovative Internet solutions and excellent service.

                 Please feel free to browse my website and see why World Proerties International is so unique.  We can assist throughout the entire transaction from your sale/purchase, mortgage, home warranty, closing and insurance needs.

                 One Company...One Solution...One Stop!",
                 :permalink => "jend",
                 :idx_url => "http://framing.usamls.net/framing/default.asp?f_id=RW%5DWZWXXWZW%5DWR",
                 :active => true)
  end

  def self.down
    Agend.find_by_permalink("jend").destroy
  end
end