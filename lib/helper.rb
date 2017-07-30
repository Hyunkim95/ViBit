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

  def self.distance(loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end



  def self.get_last_half_year
    current_month = Date.today.month
    month_names = 5.downto(0).map { |n| DateTime::MONTHNAMES[(current_month - n) % 12][0..2] }
    month_names
  end

  def self.get_deductions(user_id)
    current_month = Date.today
    month_names = 5.downto(0).map { |n| (current_month - n.months).to_s[0..6] }
    month_names

    deductions_object = {}

    deductions_object["traffic_light"] = 0
    deductions_object["sign_adherence"] = 0
    deductions_object["speed"] = 0

    puts deductions_object

    month_names.each do |month|
      array = DriveDatum.where(month: month).where(user_id: user_id)

      array.each do |data|
        data[:stats].each do |stat|
          deductions_object[stat["violation"]] += 1
        end
      end
    end

    return deductions_object
  end

  def self.get_traffic_light_deductions(user_id)
    current_month = Date.today
    month_names = 5.downto(0).map { |n| (current_month - n.months).to_s[0..6] }
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

    month_array = []

    month_names.each do |month|
      month_array.push(month_object[month])
    end

    return month_array
  end

  def self.get_sign_adherence_deductions(user_id)
    current_month = Date.today
    month_names = 5.downto(0).map { |n| (current_month - n.months).to_s[0..6] }
    month_names

    month_object = {}

    month_names.each do |month|
      month_object[month] = 0
      array = DriveDatum.where(month: month).where(user_id: user_id)

      array.each do |data|
        data[:stats].each do |stat|
          if stat["violation"] == "sign_adherence"
            month_object[month] += 1
          end
        end
      end
    end

    month_array = []

    month_names.each do |month|
      month_array.push(month_object[month])
    end

    return month_array
  end

  def self.get_speed_deductions(user_id)
    current_month = Date.today
    month_names = 5.downto(0).map { |n| (current_month - n.months).to_s[0..6] }
    month_names

    month_object = {}

    month_names.each do |month|
      month_object[month] = 0
      array = DriveDatum.where(month: month).where(user_id: user_id)

      array.each do |data|
        data[:stats].each do |stat|
          if stat["violation"] == "speed"
            month_object[month] += 1
          end
        end
      end
    end

    month_array = []

    month_names.each do |month|
      month_array.push(month_object[month])
    end

    return month_array
  end

  def self.get_month_range_names
    range = []
    range.push((Time.now).strftime("%b %Y"))
    range.push((Time.now-5.months).strftime("%b %Y"))
  end

  def self.total_sec(array)
    array[0] * 60 * 60 + array[1] * 60 + array[2]
  end

  def self.time_formatter(sec)
    seconds = sec % 60
    minutes = (sec / 60) % 60
    hours = sec / (60 * 60)

    format("%02d:%02d:%02d", hours, minutes, seconds)
  end

  def self.violation_counter(array)
    obj = Hash.new(0)
    array.each do |item|
      type = item[:violation]
      obj[type] += 1
    end
    obj
  end

  def self.count_deduction_drive(array)
    return 100 - array.length * 5
  end

end
