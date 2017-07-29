require_dependency 'helper.rb'

class PageController < ApplicationController
  include Helper
  def index

  end

  def trip_progress

  end

  def trip_summary
    @trip_data = {
      stats: [
        {
          violation: "traffic_light",
          location: [-33.881842, 151.203960]
        },
        {
          violation: "sign_adherence",
          location: [-33.879237, 151.205443]
        }
      ],
      start_time: "2017-07-29 06:11:00",
      end_time: "2017-07-29 06:20:00",
      start_loc: [-33.884369, 151.175759],
      end_loc: [-33.877611, 151.211725]
    }

    @drive_datum = DriveDatum.new(@trip_data)
    @drive_datum[:user_id] = current_user.id
    @drive_datum[:month] = Helper.get_month_year(@trip_data)

    @drive_datum.save
  end

  def traffic_light
    @month_labels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"].to_json
    @deduction_points = [0, 0, 11, 3, 2, 1]
  end

  def progress
    @good_drives = Helper.count_good_drives(current_user)
  end

  def rewards
    @score = Helper.get_monthly_score(Date.today.to_s[0..6], current_user.id)
  end

end
