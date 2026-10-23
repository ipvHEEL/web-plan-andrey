-- Параметры заказа материала в окне потребности (ConsurmptionForm):
-- страховой запас и минимальный квант хранятся рядом с плечом доставки, одна строка на артикул.
-- Скрипт можно запускать повторно.

-- Строка может появиться, когда задан только страховой запас или квант, поэтому плечо доставки становится необязательным.
IF EXISTS (SELECT 1 FROM sys.columns
           WHERE object_id = OBJECT_ID(N'[dbo].[tDaysForDelivery]') AND name = N'DaysForDelivery' AND is_nullable = 0)
    ALTER TABLE [dbo].[tDaysForDelivery] ALTER COLUMN [DaysForDelivery] INT NULL;
GO

-- Страховой запас (в окне — дробное число)
IF COL_LENGTH(N'dbo.tDaysForDelivery', N'SafetyStock') IS NULL
    ALTER TABLE [dbo].[tDaysForDelivery] ADD [SafetyStock] FLOAT NULL;
GO

-- Минимальный квант (в окне — целое, округляется вверх)
IF COL_LENGTH(N'dbo.tDaysForDelivery', N'MinQuantum') IS NULL
    ALTER TABLE [dbo].[tDaysForDelivery] ADD [MinQuantum] INT NULL;
GO
