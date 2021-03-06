class User < ActiveRecord::Base
  has_many :attendances
  has_and_belongs_to_many :roles
  validates_uniqueness_of :card, :message => I18n.t("card has been taken"), :allow_nil => true, :allow_blank => true
  
  validates_presence_of :name, :message => I18n.t("name must not be nil")
  validates_presence_of :surname, :message => I18n.t("surname must not be nil")


  def self.now_working
    working = []
    users = User.find(:all)
    users.each do |user|
      if user.attendances.last
        if user.attendances.last.end.nil?
          working << user
        end
      end
    end
    return working
  end

  def self.now_working_count
    count = 0
    users = User.find(:all)
    users.each do |user|
      if user.attendances.last
        if user.attendances.last.end.nil?
          count = count + 1
        end
      end
    end
    return count
  end

  def is_admin?
    if self.roles.include?(Role.first)
      return true
    else
      return false
    end
  end

  def attendance_ended?
    if self.attendances == []
      return true
    end
    if self.attendances != []
      if self.attendances.last.end != nil
        return true
      end
    end
    return false
  end
  
  def display_name
    return self.surname.to_s + " " + self.name.to_s
  end

end
