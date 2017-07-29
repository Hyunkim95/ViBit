module Helper
  def self.count_good_drives(user_id)
      counter = 0
      DriveDatum.where(user_id: user_id).each do |data|
          if data.stats.length == 0
            counter += 1
          end
      end
      counter
  end

  def self.get_month_year(drive)
    drive[:start_time][0..6]
  end

  def self.drive_between_months(month, user_id)
    DriveDatum.where(month: month).where(user_id: user_id).length
  end

  def self.count_deduction(month, user_id)
    counter = 0
    array = DriveDatum.where(month: month).where(user_id: user_id)
    array.each do |data|
      counter += data[:stats].length
    end
    counter
  end
end
