class Attendance < ActiveRecord::Base
  belongs_to :user
  has_many :pauses

  before_create :compose_token
  
  def duration
    if self.start and self.end
      s = self.start.to_f
      e = self.end.to_f
      difference = e - s
      seconds    =  difference % 60
      difference = (difference - seconds) / 60
      minutes    =  difference % 60
      difference = (difference - minutes) / 60
      hours      =  difference % 24
      difference = (difference - hours)   / 24
      days       =  difference % 7
      hours = hours + (days*24)
      ret = ""
      ret << hours.to_i.to_s + "h " if hours.to_i > 0
      ret << minutes.to_i.to_s + "m " + seconds.to_i.to_s + "s"
      return ret
      #return hours.to_i.to_s + "h " + minutes.to_i.to_s + "m " + seconds.to_i.to_s + "s" 
    else
      return I18n.t("attendance unfinished")
    end
  end


  def duration_without_break
      if self.start and self.end
        s = self.start.to_f
        e = self.end.to_f
        dirty = e - s
        breaks = 0
        if self.pauses != []
          self.pauses.each do |b|
            if b.start and b.end
              breaks = breaks + (b.end.to_f - b.start.to_f)
            end
          end
        end
        difference = dirty - breaks
        seconds    =  difference % 60
        difference = (difference - seconds) / 60
        minutes    =  difference % 60
        difference = (difference - minutes) / 60
        hours      =  difference % 24
        difference = (difference - hours)   / 24
        days       =  difference % 7
        hours = hours + (days*24)
        ret = ""
        ret << hours.to_i.to_s + "h " if hours.to_i > 0
        ret << minutes.to_i.to_s + "m " + seconds.to_i.to_s + "s"
        return ret
      else
        return I18n.t("attendance unfinished")
      end
    end

  def pause_ended?
    if self.pauses == []
      return true
    end
    if self.pauses != []
      if self.pauses.last.end != nil
        return true
      end
    end
    return false
  end

  def compose_token
    self.token = Terminal.first.machine_id + Time.now.strftime("%Y%d%m%H%m%S")
  end
end
