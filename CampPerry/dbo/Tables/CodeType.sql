﻿CREATE TABLE [dbo].[CodeType] (
    [Recnum]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [TYPE]        VARCHAR (10)  DEFAULT (' ') NOT NULL,
    [DESCRIPTION] VARCHAR (30)  DEFAULT (' ') NOT NULL,
    [COMMENT]     VARCHAR (MAX) NULL,
    CONSTRAINT [CodeType_INDEX01] PRIMARY KEY CLUSTERED ([TYPE] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CodeType_INDEX00]
    ON [dbo].[CodeType]([Recnum] ASC) WITH (FILLFACTOR = 70);

