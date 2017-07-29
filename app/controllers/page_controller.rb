class PageController < ApplicationController
  def index

  end

  def trip

  end

  def trip_summary
    @trip_data = {
      stats: [
        {
          violation: "traffic_light",
          location: [-33.881842, 151.203960]
        },
        {
          violation: "school_zone",
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

    @drive_datum.save
  end

end
