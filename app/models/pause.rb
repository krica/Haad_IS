class Pause < ActiveRecord::Base
  belongs_to :attendance

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
      return "--"
    end
  end


end
