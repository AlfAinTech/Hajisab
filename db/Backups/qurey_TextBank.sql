ALTER TABLE TextBank
DROP CONSTRAINT FK_TextBank_DreamLayouts;


alter table TextBank
    drop column DreamID, PageID,ControlName


 alter table TextBank
    add  IsShared bit not null default(0)