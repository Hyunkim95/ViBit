# ViBit

## Introduction
How are reckless drivers supposed to know they are driving dangerously?
How can we help new drivers improve rapidly and make less mistakes?
How can we make Australian roads safer for all?

We at ViBit aim to address this problem by designing a solution that not only incentivizes positive driving behaviours, but reduces reckless driving over the long term.

Oh, did I mention that it also saves lives?

In fact, in NSW alone, 916 people die on average per year from traffic accidents. When we look at a national level, that number increases significantly to 5100 deaths per year.

By reducing reckless driving behaviours such as speeding, or running through stop signs, we can create a proactive environment that’ll reduce the number of traffic accident deaths per year.

With this, we can definitely make Australian roads safer for all.

## How it works/ HLD
ViBit technology consists of a dash cam with an image processing unit and a mobile app to track and display incoming data. The dash cam is stuck to the car window screen. Whilst driving, the ViBit dashcam will provide voice notification and a light flash when an offence has occurred.

Throughout the ride, the ViBit mobile application will record metrics on driving improvement points and at where they occured, Metrics consist of how many times the user has driven over the speed limit, ran a red light or ignored road signs.

This information is captured as feedback at the end of each drive. A mistake free drive will result in positive feedback. A drive with mistakes will result in suggestions on how to improve for the next drive.

### Reward:
Over long periods of time (1 month), users will be incentivised for consecutive good driving behaviours (i.e. all drives have been mistake free over the last month). These rewards could include things such as discounted petrol, or free carwashes. Once again, the aim is to promote positive driving.

### Progress:
Furthermore, users will also given the option to scrutinize their past driving behaviour (i.e past month VS last year). Based off this, they can get suggestions on where they can improve their driving (i.e. speeding etc).



## Data:

One of the most common cases of unsafe driving is speeding. As our app aims to improve driver safety and habits, we examined Speeding Data from NSW to examine where a lot of speeding drivers came from. The dataset “Data on the speeding fines by the offender’s postcode” gave us speeding fines issued by either police or using speed cameras and the value gained from offender’s postcodes.

We then used the offender’s postcodes to generate a heat map of offenders. This was done by taking data from “Longtitude Latitude from Postcode data” to map longtitude and latitude to different postcodes, allowing us to visualise data on PowerBI. We have demonstrated that these data can be integrated into the ViBit app via the  NEAR API.

In addition, we also used ATO data to attempt to determine the demographics of speeding offenders. From this, we found that although there’s no correlation between median taxable income and average fines paid, meaning that all income levels speed equally, it is also found that drivers from suburbs with higher taxable income are more likely to speed than suburbs with smaller taxable income.

Using the ARDD, GRIM and Centre for Road Safety dataset we found these interesting facts that will inform our marketing strategy and feed the app’s education content (similar to 10 fun facts in the NSW roads users’ handbook):
1.	Fatal road accidents are reducing
2.	Land transport accidents is the 9th killer in Australia
3.	Highest deaths occur between ages of 20-29
4.	Males are more likely to be involved in accidents than females
5.	17 deaths per 100,000 drivers
6.	NSW highest number of fatal crashes in Australia
7.	The number of single vehicle crashes is similar to multi-vehicle crashes
8.	Fatalities are most likely to occur at 60 km and 100 km zones
9.	Liverpool has the highest number of traffic infringement in NSW

Australian Road Deaths Database (ARDD): https://data.gov.au/dataset/australian-road-deaths-database
Geoscience Australia Sunrise & Sunset times: http://www.ga.gov.au/bin/geodesy/run/sunrisenset
Longtitude Latitude from Postcode data: http://www.corra.com.au/australian-postcode-location-data/
Statistics of deaths (by land transport accident) General Record of Incidence of Mortality (GRIM) books:
https://data.gov.au/dataset/grim-books
Taxation Statistics 2013-14 - Individuals - Table 8 - data.gov.au:
https://data.gov.au/dataset/taxation-statistics-2013-14/resource/099ebd15-242d-4466-9e32-a2beda3d8894
Data on the speeding fines by the offender’s postcode: https://data.nsw.gov.au/data/dataset/data-on-the-speeding-fines-by-the-offender-s-postcode
Centre for Road Safety, Crash and casualty statistics:
http://roadsafety.transport.nsw.gov.au/statistics/interactivecrashstats/nsw.html?tabnsw=8

## Target users:
Through our discovery phase, we uncovered 4 main users groups:

New drivers: These are users who are new to the road, looking to improve their driving quickly.

Bad drivers: These are users who are aware they are not good drivers. They are looking to improve their driving.

Reckless drivers: These are users who are not aware they are dangerous drivers. They may cause issues for other drivers on the road due to their reckless driving.

Incentivised drivers: These are users who are good drivers. They will use the app for their incentives.

The users varied on their emotional and functional needs. The user experience and app was designed to best meet these needs.

## Application:
With the limited timeframe and an understanding of its core functionalities, we came to a decision we needed a framework that is good for rapid prototyping.  We concluded Ruby On Rails would be the best decision as it has many gems and resources to leverage. The general flow and methodology of the development of the application involved a collaboration between the developers and designers to ensure a smooth integration between back end and front end.

## Future features:
We intend to implement the following features in the future

### Road Black-zones

We intended to implement road black-zones by using NSW geolocation accident data. Unfortunately, this data was not open. If we were to implement this feature, we would classify black-zones depending on where more accidents have happened historically and warn users places to be careful.

### Synthesis between features

Our application has many features and functionalities which work cohesively together - however given the limited the time frame and resources we were unable to integrate the features together.  The flow of the application involves the recording of video and an analysis to generate statistics and information of the driver - our backend is capable of processing JSON data and showing relevant information accordingly.  Our application is capable of identifying signs through image and video processing to give the viable JSON data for the back end use - however it requires further data and input to make it smarter. Once this has been done, we will be integrating it into the back end

### Uploading to the cloud

Our application is capable of recording and analysing both the driver’s behaviour and their vision - this gives it the ability to disrupt the black box industry.  As we are collecting the data, we want to be able store and upload the driver’s actions through a cloud software - increasing the potential to collaborate with other companies (such as the insurance companies and the government).
