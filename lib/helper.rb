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

end
