
 
 alter table AlharmainUser
    drop column adults, children,infants


ALTER TABLE AlharmainUserPackage
ADD adults int Not Null default(0),
children int Not Null default(0),
infants int Not Null default(0)
