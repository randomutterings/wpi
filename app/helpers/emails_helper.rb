module EmailsHelper
  
  def subject_text
    unless params[:listing_id].nil?
      listing = Listing.find(params[:listing_id])
      if params[:email_type] == "agent"
        text = "Question about #{Listing.find(params[:listing_id]).title}"
      elsif params[:email_type] == "friend"
        text = "I found a property for you at #{APP_CONFIG[:site_name]}"
      end
    end
    text
  end
  
  def body_text
    unless params[:listing_id].nil?
      listing = Listing.find(params[:listing_id])
      if params[:email_type] == "agent"
        text = "I have a Question about the listing #{link_to(listing.title, listing_url(listing))}"
      elsif params[:email_type] == "friend"
        text = "I wanted to share this property listing with you at #{APP_CONFIG[:site_name]}.  You can find it by clicking #{link_to("here", listing_url(listing))}."
      end
    end
    text
  end
  
end
