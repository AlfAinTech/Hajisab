use [16_feb]
ALTER TABLE PackageItenryDetail
  ADD  hotelID INT DEFAULT(1)
  
  ALTER TABLE PackageItenryDetail
ADD CONSTRAINT FK_hotelID
FOREIGN KEY (hotelID) REFERENCES Hotel(id);


ALTER TABLE PackageItenryDetail
  ADD  transportID INT DEFAULT(1)
  
  ALTER TABLE PackageItenryDetail
ADD CONSTRAINT FK_transportID
FOREIGN KEY (transportID) REFERENCES TransPort(id);
