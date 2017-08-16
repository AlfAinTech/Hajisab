ALTER TABLE PackageDetail
ADD packageType nvarchar(50) not null default(1)

ALTER TABLE PackageDetail
Drop Column totalAmount