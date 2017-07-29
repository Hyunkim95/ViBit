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

  def self.get_monthly_score(month, user_id)
    return 100 if drive_between_months(month, user_id) != 0 && count_deduction(month, user_id) == 0
    return 0 if drive_between_months(month, user_id) == 0
    (drive_between_months(month, user_id) * 100 - count_deduction(month, user_id) * 5) / drive_between_months(month, user_id)
  end

  def self.get_last_half_year
    current_month = Date.today.month
    month_names = 6.downto(1).map { |n| DateTime::MONTHNAMES[(current_month - n) % 12][0..2] }
    month_names
  end

  def self.get_traffic_light_deductions(user_id)
    current_month = Date.today
    month_names = 6.downto(1).map { |n| (current_month - n.months).to_s[0..6] }
    month_names

    month_object = {}

    month_names.each do |month|
      month_object[month] = 0
      array = DriveDatum.where(month: month).where(user_id: user_id)

      array.each do |data|
        data[:stats].each do |stat|
          if stat["violation"] == "traffic_light"
            month_object[month] += 1
          end
        end
      end
    end

    puts month_names
    puts month_object

    month_array = []

    month_names.each do |month|
      month_array.push(month_object[month])
    end

    return month_array

  end

end
