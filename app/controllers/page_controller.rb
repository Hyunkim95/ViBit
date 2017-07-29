require_dependency 'helper.rb'

class PageController < ApplicationController
  include Helper
  def index

  end

  def trip_progress

  end

  def trip_summary
    # stats = [["traffic_light", [-33.881842, 151.20396]], ["sign_adherence", [-33.879237, 151.205443]]].to_json
    @trip_data = {
      stats: [{
        violation: "traffic_light",
        location: [-33.881842, 151.20396]
        },
        {
          violation: "sign_adherence",
          location: [-33.879237, 151.205443]
        },
      ],
      start_time: "2017-04-29 06:11:00",
      end_time: "2017-04-29 06:20:00",
      start_loc: [-33.884369, 151.175759],
      end_loc: [-33.877611, 151.211725]
    }

    @drive_datum = DriveDatum.new(@trip_data)
    @drive_datum[:user_id] = current_user.id
    @drive_datum[:month] = Helper.get_month_year(@trip_data)

    @drive_datum.save
  end

  def traffic_light
    @month_labels = Helper.get_last_half_year.to_json
    @deduction_points = Helper.get_traffic_light_deductions(current_user.id)
  end

  def progress
    @good_drives = Helper.count_good_drives(current_user)
  end

  def rewards
    @score = Helper.get_monthly_score(Date.today.to_s[0..6], current_user.id)
  end

end
