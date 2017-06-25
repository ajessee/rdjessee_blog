![RDJessee](https://s3.amazonaws.com/andre-pictures/grandpaSigBlack.jpg)
 
# [Ralph Donald Jessee Blog](https://ralphdonaldjessee.com/) 
 
My grandfather, Ralph Donald Jessee, lived most of his life in Lima, Ohio. Late in his life, after his third wife died, his daughter Catherine invited him to live with her in Lafayette, Louisiana. After he moved down there, she enrolled him in a life writing class and much to everyone's surprise, he wrote prolifically. When he died in 2016, he left behind a collection of over 170 stories.
 
I built this web application as a platform to share these stories with his extended family and preserve his writing legacy for posterity. It's also a place to share pictures of his life, and users can signup to share their own personal memories of Don. 
 
The app is written in Rails 4 and currently deployed in production using AWS. 
 
## Features:
 
* Mobile-first design.
* Single page application with live scrolling between sections.
* Parallax scrolling.
* Blog with comments, tagging, and picture thumbnails for blog cards.
* Blog filtering feature to organize by year written, decade story takes place in, location of story, genre of story, category of story, Don's life stage (early/mid/late), or alphabetically.
* Pagination for blog and pictures index pages.
* Pictures page, with feature to allow users to upload their own pictures and comment on existing pictures.
* Rotating carousel feature for obituary.
* Guestbook to allow users to leave memories or comments of Don on the main page.
* HTTPS secure connection to protect sensitive user data.
* Secure user sign-in with administrative panel to manage users and stories.
* User activation email upon user sign-up to ensure that user owns email address.
* Automatic password reset feature via email.
 
## Future Features:
 
* Video/audio upload and display.
* Feature to record users narrating stories.
 
## Technical Specifications:
 
* Written in Rails 4.
* Hosted on AWS Elastic Compute Cloud (EC2) instance and deployed using Elastic Beanstalk.
* Setup to use Secure Shell (SSH) to connect securely to EC2 instance.
* Uses AWS Simple Email Service (SES) to deliver send user activation emails, password reset emails, or any other communication.
* Uses AWS Relational Database Service (RDS) and PostgresQL database for data persistence to store user information.
* Uses AWS Simple Storage Service (S3) to store web application.
* Uses Google Analytics to monitor and analyze traffic, bounce rates, and page views.
* Uses Bootstrap framework for front end design.