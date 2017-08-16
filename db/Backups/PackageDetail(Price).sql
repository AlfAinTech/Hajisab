ALTER TABLE PackageDetail
 ADD 
startDate date not null  DEFAULT GETDATE() ,
  minRange float not null  DEFAULT 0,
  maxRange float not null  DEFAULT 0 