ALTER TABLE AlharmainUserPackage
ADD AccomMakkahID int not null 
FOREIGN KEY(AccomMakkahID) REFERENCES Accommodation(id);   

ALTER TABLE AlharmainUserPackage
ADD AccomMadinaID int not null 
FOREIGN KEY(AccomMadinaID) REFERENCES Accommodation(id);   