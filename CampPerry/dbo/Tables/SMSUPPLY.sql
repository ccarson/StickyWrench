﻿CREATE TABLE [dbo].[SMSUPPLY] (
    [Recnum]   BIGINT       IDENTITY (1, 1) NOT NULL,
    [SUPPLIER] VARCHAR (10) DEFAULT (' ') NOT NULL,
    [NAME]     VARCHAR (25) DEFAULT (' ') NOT NULL,
    [STREET]   VARCHAR (20) DEFAULT (' ') NOT NULL,
    [CITY]     VARCHAR (15) DEFAULT (' ') NOT NULL,
    [STATE]    VARCHAR (2)  DEFAULT (' ') NOT NULL,
    [FFLNUM]   VARCHAR (10) DEFAULT (' ') NOT NULL,
    CONSTRAINT [SMSUPPLY_INDEX01] PRIMARY KEY CLUSTERED ([SUPPLIER] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SMSUPPLY_INDEX00]
    ON [dbo].[SMSUPPLY]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SMSUPPLY_INDEX02]
    ON [dbo].[SMSUPPLY]([NAME] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);

