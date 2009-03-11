module EventsHelper
  
  def render_calendar_cell(d)
    special = false
    @events.each do |event|
      if event.day == d
        special = true
      end
    end
    if special == true
      [d.mday, {:class => "specialDay"}]
    else
      [d.mday, {:class => "normalDay"}]
    end
  end
  
  def pre
    link_to ("Prev"),:date=>@date.last_month
  end
  
  def nex
    link_to ("Next"),:date=>@date.next_month
  end
  
end
