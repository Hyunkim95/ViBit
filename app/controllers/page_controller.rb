require_dependency 'helper.rb'

class PageController < ApplicationController
  include Helper
  def index

  end

  def trip_summary
    # stats = [["traffic_light", [-33.881842, 151.20396]], ["sign_adherence", [-33.879237, 151.205443]]].to_json
    @trip_data = {
      stats: [
        {
        violation: "traffic_light",
        location: [-33.881842, 151.20396]
        },
        {
          violation: "sign_adherence",
          location: [-33.879237, 151.205443]
        },
      ],
      start_time: "2017-07-29 06:11:00",
      end_time: "2017-07-29 06:38:00",
      start_loc: [-33.884369, 151.175759],
      end_loc: [-33.877611, 151.221725]
    }
    d = DateTime.now
    end_time = [@trip_data[:end_time][11..13].to_i, @trip_data[:end_time][14..16].to_i, @trip_data[:end_time][17..19].to_i]
    start_time = [@trip_data[:start_time][11..13].to_i, @trip_data[:start_time][14..16].to_i, @trip_data[:start_time][17..19].to_i]
    total_sec = Helper.total_sec(end_time) - Helper.total_sec(start_time)
    @time = Helper.time_formatter(total_sec)
    @counter = Helper.violation_counter(@trip_data[:stats])
    @score = Helper.count_deduction_drive(@trip_data[:stats])
    @drive_datum = DriveDatum.new(@trip_data)
    @drive_datum[:user_id] = current_user.id
    @drive_datum[:month] = Helper.get_month_year(@trip_data)
    @drive_datum.save
    @distance = Helper.distance(@drive_datum[:start_loc], @drive_datum[:end_loc])
  end

  def traffic_light
    @month_labels = Helper.get_last_half_year.to_json
    @deduction_points = Helper.get_traffic_light_deductions(current_user.id)
    @deductions = Helper.get_deductions(current_user.id)
    @month_ranges = Helper.get_month_range_names
  end

  def sign_adherence
    @month_labels = Helper.get_last_half_year.to_json
    @deduction_points = Helper.get_sign_adherence_deductions(current_user.id)
    @deductions = Helper.get_deductions(current_user.id)
    @month_ranges = Helper.get_month_range_names
  end

  def speed
    @month_labels = Helper.get_last_half_year.to_json
    @deduction_points = Helper.get_speed_deductions(current_user.id)
    @deductions = Helper.get_deductions(current_user.id)
    @month_ranges = Helper.get_month_range_names
  end

  def progress
    if current_user
      @good_drives = Helper.count_good_drives(current_user)
      @deductions = Helper.get_deductions(current_user.id)
    else
      redirect_to new_user_session_path
    end
  end

  def rewards
    if current_user
      @score = Helper.get_monthly_score(Date.today.to_s[0..6], current_user.id)
    else
      redirect_to new_user_session_path
    end
  end

  def board
    @users = []
    # @sorted_user = []
    #
    # User.all.each do |user|
    #   if @sorted_user.length == 0
    #     @sorted_user.push(user)
    #   else
    #     @sorted_user.each_with_index do |item, index|
    #       if user <= item
    #
    #       end
    #     end
    #   end
    #     @sorted_user.push(user)
    # end

    User.all.each do |user|
      array = []
      array << user
      array << Helper.get_monthly_score(Date.today.to_s[0..6], user.id)
      @users << array
    end
  end

end
