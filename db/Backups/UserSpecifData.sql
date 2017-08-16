ALTER TABLE Hotel
    ADD AspNetUserID nvarchar(128) NOT NULL  DEFAULT('3ad5b021-ffea-486d-8640-9de2f6e161ca'),
     FOREIGN KEY(aspNetUserID) REFERENCES AspNetUsers(id);
     
     
     
 ALTER TABLE VisaPackages
    ADD AspNetUserID nvarchar(128) NOT NULL  DEFAULT('3ad5b021-ffea-486d-8640-9de2f6e161ca'),
     FOREIGN KEY(aspNetUserID) REFERENCES AspNetUsers(id);    
     
      
 ALTER TABLE AirLine
    ADD AspNetUserID nvarchar(128) NOT NULL  DEFAULT('3ad5b021-ffea-486d-8640-9de2f6e161ca'),
     FOREIGN KEY(aspNetUserID) REFERENCES AspNetUsers(id);  
     
     
  ALTER TABLE Dreams
    ADD AspNetUserID nvarchar(128) NOT NULL  DEFAULT('3ad5b021-ffea-486d-8640-9de2f6e161ca'),
     FOREIGN KEY(aspNetUserID) REFERENCES AspNetUsers(id); 