-- MySQL dump 10.13  Distrib 5.6.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wb2test
-- ------------------------------------------------------
-- Server version	5.6.35-1+deb.sury.org~xenial+0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `data_listing`
--

DROP TABLE IF EXISTS `data_listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_listing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) NOT NULL,
  `AccountingandLegalExpens` text,
  `ACPercentage` text,
  `AcreageDescription` text,
  `ActiveOpenHouseCount` text,
  `ADACompliant` text,
  `AdditionalBusinessNames` text,
  `AdditionalFurnishedInfo` text NOT NULL,
  `AddlMoveInCostYN` text,
  `AddressInternetDisplay` text,
  `AddressonInternet` text,
  `AdjustedAreaSF` text,
  `AdvertisingExpenses` text,
  `AgentAlternatePhone` text,
  `AgentLicenseNum` text,
  `AgentsOfficeExtension` text,
  `Amenities` text,
  `AnnualBaseRate` text,
  `ApplicationFee` text,
  `ApprovalInformation` text,
  `ApproximateLotSize` text,
  `ApproxSqftTotalArea` text,
  `Area` text,
  `AssocFeePaidPer` text,
  `AssociationFee` text,
  `AssumableChattelBalance` text,
  `AssumableYN` text,
  `AuctionType` text,
  `AuctionYN` text,
  `AvailableDate` text,
  `AvailableDocuments` text,
  `AVM` text,
  `BalconyPorchandorPatioYN` text,
  `BathsFull` text,
  `BathsHalf` text,
  `BathsTotal` text,
  `BedroomDescription` text,
  `BedsTotal` text,
  `Blogging` text,
  `BoardIdentifier` text,
  `BoatDockAccommodates` text,
  `BoatServices` text,
  `BonusAmount` text,
  `BonusYN` text,
  `BrandName` text,
  `BrokerRemarks` text,
  `BuildingAreaAlternative` text,
  `BuildingAreaAltSource` text,
  `BuildingIncludes` text,
  `BuildingNameNumber` text,
  `BuildingNumber` text,
  `BuildingSqFt` text,
  `CableAvailableYN` text,
  `CancelledDate` text,
  `CarportDescription` text,
  `CeilingDescription` text,
  `CeilingHeight` text,
  `City` varchar(250) DEFAULT NULL,
  `CloseDate` text,
  `ClosePrice` text,
  `CoAgentLicenseNum` text,
  `CoListAgent_MUI` int(11) DEFAULT NULL,
  `CoListAgentDirectWorkPhone` text,
  `CoListAgentEmail` text,
  `CoListAgentFullName` varchar(250) DEFAULT NULL,
  `CoListAgentMLSID` varchar(50) DEFAULT NULL,
  `CoListOffice_MUI` int(11) DEFAULT NULL,
  `CoListOfficeMLSID` varchar(50) DEFAULT NULL,
  `CoListOfficeName` varchar(250) DEFAULT NULL,
  `CoListOfficePhone` text,
  `ColumnDescription` text,
  `CommonAreaMaintAmount` text,
  `CommonAreaMaintIncludes` text,
  `ComplexName` text,
  `ComprehensivePlanUse` text,
  `ComptoBuyersAgent` text,
  `ComptoNonRepresentative` text,
  `ComptoTransactionBroker` text,
  `ConditionalDate` text,
  `ConstructionType` text,
  `ConvertibleBedroomYN` text,
  `CoolingDescription` text,
  `CoSellAgentLicenseNum` text,
  `CoSellingAgent_MUI` int(11) DEFAULT '0',
  `CoSellingAgentDirectWorkPhone` text,
  `CoSellingAgentEmail` text,
  `CoSellingAgentFullName` varchar(250) DEFAULT NULL,
  `CoSellingAgentMLSID` varchar(50) DEFAULT NULL,
  `CoSellingOffice_MUI` int(11) DEFAULT NULL,
  `CoSellingOfficeMLSID` varchar(50) DEFAULT NULL,
  `CoSellingOfficeName` text,
  `CoSellingOfficePhone` text,
  `CostofSales` text,
  `CountyLandCode` text,
  `CountyOrParish` text,
  `CurrentPrice` text,
  `DadeAssessedAmtSOHValue` text,
  `DadeMarketAmtAssessedAmt` text,
  `DaysOpen` text,
  `DecalNumber` text,
  `DeedRestrictions` text,
  `DenDimensions` text,
  `DepositInformation` text,
  `Design` text,
  `DesignDescription` text,
  `Development` text,
  `DevelopmentName` text,
  `DiningAreaDimensions` text,
  `DiningDescription` text,
  `DiningRoomDimensions` text,
  `Directions` text,
  `DockHeight` text,
  `DockInformation` text,
  `DockNumber` text,
  `DOM` text,
  `DoorHeight` text,
  `EaveHeight` text,
  `EfficiencyYN` text,
  `ElectricService` text,
  `ElementarySchool` text,
  `ElevationAboveSeaLevel` text,
  `EnvironmentalAudit` text,
  `EquestrianFeatures` text,
  `EquipmentAppliances` text,
  `ExcludeFromInventoryStats` text,
  `ExpenseAmount` text,
  `ExpensesIncluded` text,
  `ExpInclAcctgLegalYN` text,
  `ExpInclAdvLicPermitYN` text,
  `ExpInclElectricYN` text,
  `ExpInclExterminationYN` text,
  `ExpInclGasOilYN` text,
  `ExpInclInsuranceYN` text,
  `ExpInclJanitorYN` text,
  `ExpInclLawnMaintenanceYN` text,
  `ExpInclMaintandRepairYN` text,
  `ExpInclManagementYN` text,
  `ExpInclMiscellaneousYN` text,
  `ExpInclPoolServiceYN` text,
  `ExpInclPropertyTaxYN` text,
  `ExpInclReplaceReserveYN` text,
  `ExpInclRetaxYN` text,
  `ExpInclSuppliesYN` text,
  `ExpInclTrashYN` text,
  `ExpInclWaterSewerYN` text,
  `ExpirationDate` datetime DEFAULT NULL,
  `ExteriorFeatures` text,
  `FeeDescription` text,
  `FillDescription` text,
  `FillFromRecord_MUI` text,
  `FillFromRecord_TableID` text,
  `FireProtection` text,
  `FixtureValue` text,
  `FloodZone` text,
  `FloorDescription` text,
  `FolioNum2ndParcel` text,
  `ForLeaseMLSNumber` text,
  `ForLeaseYN` text,
  `ForSaleMLSNumber` text,
  `ForSaleYN` text,
  `FrontExposure` text,
  `FurnAnnualRent` text,
  `FurnishedInfoList` text,
  `FurnishedInfoSold` text,
  `FurnOffSeasonRent` text,
  `FurnSeasonalRent` text,
  `GarageDescription` text,
  `GasDescription` text,
  `GeographicArea` text,
  `GreenEnergyEfficient` text,
  `GrossOperatingIncome` text,
  `GrossRent` text,
  `GrossRentIncome` text,
  `GrossSales` text,
  `GrossScheduledIncome` text,
  `GroundCover` text,
  `GroundCoverDescription` text,
  `GuestHouseDescription` text,
  `HardshipPackage` text,
  `HeatingDescription` text,
  `HousingOlderPersonsAct` text,
  `IDXOptInYN` text,
  `ImprovementHeightBUS` text,
  `ImprovementHeightCOM` text,
  `IncExpStatementPeriod` text,
  `InformationAvailable` text,
  `InputBrokerRemarks` text,
  `InsuranceExpense` text,
  `IntendedUse` text,
  `InteriorCeilingHeight` text,
  `InteriorFeatures` text,
  `InternetRemarks` text,
  `InternetYN` text,
  `InventoryValue` text,
  `IsDeleted` text,
  `Jurisdiction` text,
  `LandImprovements` text,
  `LandLeaseAmount` text,
  `LandLeaseFeePaidPer` text,
  `LastChangeTimestamp` datetime DEFAULT NULL,
  `LastChangeType` text,
  `LastStatus` text,
  `LeasePrice` text,
  `LeaseTermInfo` text,
  `LeaseTermRemaining` text,
  `LegalDescription` text,
  `LenderApproval` text,
  `Licenses` text,
  `ListAgent_MUI` int(11) DEFAULT NULL,
  `ListAgentDirectWorkPhone` text,
  `ListAgentEmail` text,
  `ListAgentFullName` varchar(250) DEFAULT NULL,
  `ListAgentMLSID` varchar(50) DEFAULT NULL,
  `ListingContractDate` datetime DEFAULT NULL,
  `ListingType` varchar(150) DEFAULT NULL,
  `ListOffice_MUI` int(11) DEFAULT NULL,
  `ListOfficeMLSID` varchar(50) DEFAULT NULL,
  `ListOfficeName` varchar(250) DEFAULT NULL,
  `ListOfficePhone` text,
  `ListPrice` text,
  `Location` text,
  `LocationofProperty` text,
  `LotDepth` text,
  `LotDescription` text,
  `LotFrontage` text,
  `LotorTrackNum` text,
  `LotSqFootage` text,
  `LPAmtSqFt` text,
  `MainLivingArea` text,
  `MaintandRepairsExpense` text,
  `MaintenanceChargeMonth` text,
  `MaintenanceFeeIncludes` text,
  `MaintenanceIncludes` text,
  `MaintFeePaidPer` text,
  `ManagementCompany` text,
  `ManagementCompanyPhone` text,
  `ManagementExpense` text,
  `ManufacturedHomeMiscell` text,
  `ManufacturedHomeSize` text,
  `MasterBathroomDescription` text,
  `Matrix_Unique_ID` int(11) DEFAULT NULL,
  `MatrixModifiedDT` datetime DEFAULT NULL,
  `MaximumCeilingHeight` text,
  `MaximumLeasableSqft` text,
  `MemberFeePaidPer` text,
  `MembershipPurchaseFee` text,
  `MembershipPurchRqdYN` text,
  `MiddleSchool` text,
  `MilestoBeach` text,
  `MilestoExpressway` text,
  `MinimumLeasePeriod` text,
  `MinimumNumofDaysforLease` text,
  `MinSFLivingAreaReqmt` text,
  `Miscellaneous` text,
  `MiscellaneousExpense` text,
  `MiscellaneousImprovements` text,
  `MiscellaneousInformation` text,
  `MLSNumber` text,
  `ModelName` text,
  `MoveInDollars` text,
  `MultipleOffersAcceptedYN` text,
  `MunicipalCode` text,
  `Neighborhoods` text,
  `NetOperatingIncome` text,
  `NumBays` text,
  `NumBuildings` text,
  `NumCarportSpaces` text,
  `NumCeilingFans` text,
  `NumEmployees` text,
  `NumFloors` text,
  `NumGarageSpaces` text,
  `NumInteriorLevels` text,
  `NumLeasesYear` text,
  `NumLoadingDoors` text,
  `NumMeters` text,
  `NumOffices` text,
  `NumParcels` text,
  `NumParkingSpaces` text,
  `NumSeats` text,
  `NumStories` text,
  `NumTenants` text,
  `NumTimesLeasedYear` text,
  `NumToilets` text,
  `NumUnits` text,
  `OccupancyInformation` text,
  `OccupancyPercentage` text,
  `OfficeFaxNumber` text,
  `OffMarketDate` datetime DEFAULT NULL,
  `OnSiteUtilities` text,
  `OriginalEntryTimestamp` datetime DEFAULT NULL,
  `OriginalListPrice` text,
  `OtherExpenses` text,
  `OtherIncomeExpense` text,
  `OwnerAgentYN` text,
  `Ownership` text,
  `PACEYN` text,
  `ParcelNumber` text,
  `ParcelNumberMLX` text,
  `ParkingDescription` text,
  `ParkingRestrictions` text,
  `ParkingSpaceNumber` text,
  `PatioBalconyDimensions` text,
  `PendingDate` text,
  `PetRestrictions` text,
  `PetsAllowedYN` text,
  `PhotoCount` int(11) DEFAULT NULL,
  `PhotoModificationTimestamp` datetime DEFAULT NULL,
  `PoolDescription` text,
  `PoolDimensions` text,
  `PoolYN` text,
  `PossessionInformation` text,
  `PostalCode` text,
  `PostalCodePlus4` text,
  `PreviousStatus` text,
  `PriceAcre` text,
  `PriceChangeTimestamp` text,
  `PropertyDescription` text,
  `PropertyDetachedYN` text,
  `PropertySqFt` text,
  `PropertySubType` varchar(150) DEFAULT NULL,
  `PropertyType` varchar(150) DEFAULT NULL,
  `PropertyTypeInformation` text,
  `PropTypeTypeofBuilding` text,
  `ProviderKey` text,
  `RailDescription` text,
  `RATIO_ClosePrice_By_ListPrice` text,
  `RealEstateTaxes` text,
  `RecLeaseMoFeePaidPer` text,
  `RecLeaseMonth` text,
  `ReimbursableSqFt` text,
  `Remarks` text,
  `RentalDepositIncludes` text,
  `RentalPaymentIncludes` text,
  `RentIncludes` text,
  `RentPeriod` text,
  `RentStatusApril` text,
  `RentStatusAugust` text,
  `RentStatusDecember` text,
  `RentStatusFebruary` text,
  `RentStatusJanuary` text,
  `RentStatusJuly` text,
  `RentStatusJune` text,
  `RentStatusMarch` text,
  `RentStatusMay` text,
  `RentStatusNovember` text,
  `RentStatusOctober` text,
  `RentStatusSeptember` text,
  `REOYN` text,
  `Restrictions` text,
  `RoadDescription` text,
  `RoadFrntgDescription` text,
  `RoadFrontage` text,
  `RoadTypeDescription` text,
  `Roof` text,
  `RoofDescription` text,
  `RoomCount` text,
  `RoomsDescription` text,
  `SaleIncludes` text,
  `SaleIncludesINCL` text,
  `SaleIncludesSALE` text,
  `SaleTerms` text,
  `Section` text,
  `SecurityInformation` text,
  `SellerContributionsAmt` text,
  `SellerContributionsYN` text,
  `SellingAgentDirectWorkPhone` text,
  `SellingAgentEmail` text,
  `SellingAgentFullName` varchar(250) DEFAULT NULL,
  `SellingAgentLicenseNum` text,
  `SellingAgentMLSID` varchar(50) DEFAULT NULL,
  `SellingOfficeMLSID` varchar(50) DEFAULT NULL,
  `SellingOfficeName` text,
  `SellingOfficePhone` text,
  `SeniorHighSchool` text,
  `SeparateMeterYN` text,
  `SerialNumber` text,
  `ServiceExpense` text,
  `SewerDescription` text,
  `ShortSaleAddendumYN` text,
  `ShortSaleYN` text,
  `ShowingInstructions` text,
  `ShowingSuiteEmailInfoYN` text,
  `ShowingSuiteSettingYN` text,
  `ShowingTimeFlag` text,
  `SoldPriceperSF` text,
  `SourceofExpenses` text,
  `SpaYN` text,
  `SpecialAssessmentYN` text,
  `SpecialInformation` text,
  `SprinklerDescription` text,
  `SqFtLAofGuestHouse` text,
  `SqFtLivArea` text,
  `SqFtOccupied` text,
  `SqFtTotal` text,
  `StateOrProvince` text,
  `Status` varchar(50) DEFAULT NULL,
  `StatusChangeTimestamp` datetime DEFAULT NULL,
  `StatusContractualSearchDate` datetime DEFAULT NULL,
  `StormProtection` text,
  `StreetDirPrefix` text,
  `StreetDirSuffix` text,
  `StreetName` text,
  `StreetNumber` text,
  `StreetNumberNumeric` text,
  `StreetSuffix` text,
  `StreetViewParam` text,
  `Style` text,
  `StyleofBusiness` text,
  `StyleofProperty` text,
  `StyleTran` text,
  `SubBoardID` text,
  `SubdivisionComplexBldg` text,
  `SubdivisionInformation` text,
  `SubdivisionName` text,
  `SubdivisionNumber` text,
  `SupplementalRemarks` text,
  `SupplementCount` text,
  `SupplementModificationTimestamp` text,
  `SupplementRemarksYN` text,
  `SupplyExpense` text,
  `SurfaceDescription` text,
  `TaxAmount` text,
  `TaxInformation` text,
  `TaxYear` text,
  `TempOffMarketDate` datetime DEFAULT NULL,
  `TenantPays` text,
  `TermsAvailable` text,
  `TermsConsidered` text,
  `TotalAcreage` text,
  `TotalAssumableLoans` text,
  `TotalExpenses` text,
  `TotalFloorsInBuilding` text,
  `TotalMortgage` text,
  `TotalMoveInDollars` text,
  `TotalNumofUnitsInBuildin` text,
  `TotalNumofUnitsInComplex` text,
  `TotalUnits` text,
  `TownshipRange` text,
  `TrainingAvailableYN` text,
  `TransactionType` text,
  `TrashExpense` text,
  `TypeofAssociation` text,
  `TypeofBuilding` text,
  `TypeofBusiness` text,
  `TypeofContingencies` text,
  `TypeofGoverningBodies` text,
  `TypeofOwnership` text,
  `TypeofProperty` varchar(150) DEFAULT NULL,
  `TypeofSoil` text,
  `TypeofTrees` text,
  `UnfurnAnnualRent` text,
  `UnfurnOffSeasonRent` text,
  `UnfurnSeasonalRent` text,
  `UnitCount` text,
  `UnitDesign` text,
  `UnitFloorLocation` text,
  `UnitNumber` text,
  `UnitView` text,
  `Usage` text,
  `UsageDescription` text,
  `UtilitiesAvailable` text,
  `UtilityExpense` text,
  `UtilityRoomDimension` text,
  `VacancyRate` text,
  `VarDualRateCompYN` text,
  `View` text,
  `VirtualTour` text,
  `WaterAccess` text,
  `WaterDescription` text,
  `WaterfrontDescription` text,
  `WaterfrontFrontage` text,
  `WaterfrontPropertyYN` text,
  `WaterView` text,
  `WaterviewDescription` text,
  `WebAddress` text,
  `WindowsTreatment` text,
  `WithdrawnDate` text,
  `YearBuilt` text,
  `YearBuiltDescription` text,
  `YearEstablished` text,
  `YearofAddition` text,
  `ZoningInformation` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sysid` (`sysid`) USING BTREE,
  KEY `index_agent_code` (`ListAgentMLSID`) USING BTREE,
  KEY `index_co_agent_code` (`CoListAgentMLSID`) USING BTREE,
  KEY `index_office_id` (`ListOfficeMLSID`) USING BTREE,
  KEY `index_co_office_id` (`CoListOfficeMLSID`) USING BTREE,
  KEY `index_city` (`City`) USING BTREE,
  KEY `index_matrix` (`MatrixModifiedDT`) USING BTREE,
  KEY `index_photo_count` (`PhotoCount`) USING BTREE,
  KEY `index_co_agent_name` (`CoListAgentFullName`) USING BTREE,
  KEY `index_office_name` (`ListOfficeName`) USING BTREE,
  KEY `index_agent_name` (`ListAgentFullName`) USING BTREE,
  KEY `index_office_mui` (`ListOffice_MUI`) USING BTREE,
  KEY `index_agent_mui` (`ListAgent_MUI`) USING BTREE,
  KEY `index_co_office_mui` (`CoListOffice_MUI`) USING BTREE,
  KEY `index_co_agent_mui` (`CoListAgent_MUI`) USING BTREE,
  KEY `index_co_selling_agent_mui` (`CoSellingAgent_MUI`) USING BTREE,
  KEY `index_co_selling_office_mui` (`CoSellingOffice_MUI`) USING BTREE,
  KEY `index_selling_agent_mlsid` (`SellingAgentMLSID`) USING BTREE,
  KEY `index_selling_office_mlsid` (`SellingOfficeMLSID`) USING BTREE,
  FULLTEXT KEY `index_status` (`Status`),
  FULLTEXT KEY `index_listing_type` (`ListingType`),
  FULLTEXT KEY `index_property_type` (`PropertyType`),
  FULLTEXT KEY `index_type_of_property` (`TypeofProperty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geocode`
--

DROP TABLE IF EXISTS `geocode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geocode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) DEFAULT NULL,
  `mls` varchar(50) DEFAULT NULL,
  `st` varchar(50) DEFAULT NULL,
  `class_table` varchar(100) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `geo_create` datetime DEFAULT NULL,
  `lat` decimal(12,7) DEFAULT NULL,
  `lng` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sysid` (`sysid`) USING BTREE,
  KEY `index_st` (`st`) USING BTREE,
  FULLTEXT KEY `index_address` (`address`),
  FULLTEXT KEY `idxex_mls` (`mls`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geocode_api_key`
--

DROP TABLE IF EXISTS `geocode_api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geocode_api_key` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `active_date` datetime DEFAULT NULL,
  `last_date_use` datetime DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `geocode_error`
--

DROP TABLE IF EXISTS `geocode_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geocode_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) DEFAULT NULL,
  `mls` varchar(50) DEFAULT NULL,
  `class_table` varchar(100) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `date_create` datetime DEFAULT NULL,
  `date_error_geo` datetime DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sysid` (`sysid`) USING BTREE,
  FULLTEXT KEY `index_address` (`address`),
  FULLTEXT KEY `idxex_mls` (`mls`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idx_agent`
--

DROP TABLE IF EXISTS `idx_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mui` int(11) DEFAULT '0',
  `code` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `phone_alt` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_name` (`name`) USING BTREE,
  KEY `index_code_2` (`code`) USING BTREE,
  KEY `index_mui` (`mui`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135902 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idx_city`
--

DROP TABLE IF EXISTS `idx_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `code` varchar(45) NOT NULL DEFAULT '',
  `lat` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `lng` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `custom_filter` text,
  `view_qsearch` tinyint(1) NOT NULL DEFAULT '0',
  `view_advanced_search` tinyint(1) NOT NULL DEFAULT '0',
  `view_map` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `city_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idx_county`
--

DROP TABLE IF EXISTS `idx_county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_county` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `code` text NOT NULL,
  `lat` decimal(12,7) NOT NULL,
  `lng` decimal(12,7) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idx_office`
--

DROP TABLE IF EXISTS `idx_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_office` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mui` int(11) DEFAULT '0',
  `code` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_code` (`code`) USING BTREE,
  KEY `index_name` (`name`) USING BTREE,
  KEY `index_mui` (`mui`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idx_property_active`
--

DROP TABLE IF EXISTS `idx_property_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_property_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) NOT NULL DEFAULT '0',
  `mls_num` varchar(20) NOT NULL DEFAULT '',
  `date_property` datetime DEFAULT NULL,
  `list_date` int(11) NOT NULL DEFAULT '0',
  `date_close` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `board_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `office_id` int(11) NOT NULL DEFAULT '0',
  `office_seller_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL DEFAULT '0',
  `co_agent_id` int(11) NOT NULL,
  `agent_seller_id` int(11) NOT NULL,
  `co_agent_seller_id` int(11) NOT NULL,
  `address_short` varchar(150) NOT NULL DEFAULT '',
  `address_large` varchar(150) NOT NULL DEFAULT '',
  `price_origin` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `price_sold` int(11) NOT NULL DEFAULT '0',
  `is_commercial` tinyint(1) NOT NULL DEFAULT '0',
  `is_rental` tinyint(1) NOT NULL DEFAULT '0',
  `year` int(4) NOT NULL DEFAULT '0',
  `bed` int(11) NOT NULL DEFAULT '0',
  `bath` int(11) NOT NULL DEFAULT '0',
  `baths_half` int(11) NOT NULL DEFAULT '0',
  `img_cnt` int(11) NOT NULL DEFAULT '0',
  `image` varchar(50) NOT NULL DEFAULT '',
  `img_date` datetime DEFAULT NULL,
  `st_number` int(11) NOT NULL DEFAULT '0',
  `st_name` varchar(100) NOT NULL DEFAULT '',
  `zip` int(11) NOT NULL DEFAULT '0',
  `sqft` float NOT NULL DEFAULT '0',
  `lot_size` int(11) NOT NULL DEFAULT '0',
  `lot_desc` varchar(255) NOT NULL,
  `parking` tinyint(1) NOT NULL DEFAULT '0',
  `parking_desc` varchar(255) NOT NULL,
  `legal_desc` varchar(255) NOT NULL DEFAULT '',
  `county_id` int(11) NOT NULL DEFAULT '0',
  `wv` varchar(255) NOT NULL DEFAULT '',
  `wa` varchar(255) NOT NULL DEFAULT '',
  `area` int(11) NOT NULL DEFAULT '0',
  `more_info` text NOT NULL,
  `condo_unit` int(11) NOT NULL DEFAULT '0',
  `condo_floor` int(11) NOT NULL DEFAULT '0',
  `subdivision` varchar(255) NOT NULL DEFAULT '',
  `complex` varchar(255) NOT NULL DEFAULT '',
  `development` varchar(250) NOT NULL DEFAULT '',
  `condo_hotel` tinyint(1) NOT NULL DEFAULT '0',
  `foreclosure` tinyint(1) NOT NULL DEFAULT '0',
  `boat_dock` tinyint(1) NOT NULL DEFAULT '0',
  `water_view` tinyint(1) NOT NULL DEFAULT '0',
  `water_front` tinyint(1) NOT NULL DEFAULT '0',
  `ocean_front` tinyint(1) NOT NULL DEFAULT '0',
  `furnished` tinyint(1) NOT NULL DEFAULT '0',
  `pets` tinyint(1) NOT NULL DEFAULT '0',
  `pool` tinyint(1) NOT NULL DEFAULT '0',
  `penthouse` tinyint(1) NOT NULL DEFAULT '0',
  `fireplace` tinyint(1) NOT NULL,
  `tw` tinyint(1) NOT NULL DEFAULT '0',
  `golf` tinyint(1) NOT NULL DEFAULT '0',
  `tennis` tinyint(1) NOT NULL DEFAULT '0',
  `short_sale` tinyint(1) NOT NULL DEFAULT '0',
  `oh_info` text NOT NULL,
  `guest_house` tinyint(1) NOT NULL,
  `gated_community` tinyint(1) NOT NULL DEFAULT '0',
  `unit_floor` int(2) NOT NULL,
  `equestrian` int(2) NOT NULL,
  `eq_num_barns` int(2) NOT NULL,
  `eq_num_stalls` int(2) NOT NULL,
  `floor` varchar(255) NOT NULL,
  `folio_number` varchar(255) NOT NULL DEFAULT '',
  `fn_muni` int(4) NOT NULL,
  `fn_area` int(4) NOT NULL,
  `fn_section` int(4) NOT NULL,
  `fn_sub` int(4) NOT NULL,
  `style` varchar(255) NOT NULL DEFAULT '',
  `date_create` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `date_proccess` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `validate_status` int(11) NOT NULL DEFAULT '0',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `rg_id` int(11) NOT NULL,
  `adom` int(11) NOT NULL DEFAULT '0',
  `available_date` datetime DEFAULT NULL,
  `validate_image` int(1) NOT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `status_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sysid` (`sysid`) USING BTREE,
  KEY `index_city` (`city_id`) USING BTREE,
  KEY `index_office_id` (`office_id`) USING BTREE,
  KEY `index_agent_id` (`agent_id`) USING BTREE,
  KEY `index_is_rental` (`is_rental`) USING BTREE,
  KEY `index_is_commercial` (`is_commercial`) USING BTREE,
  KEY `index_class_id` (`class_id`) USING BTREE,
  FULLTEXT KEY `index_autocomplete` (`address_short`,`address_large`,`subdivision`,`complex`,`development`)
) ENGINE=MyISAM AUTO_INCREMENT=55925 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idx_property_extra`
--

DROP TABLE IF EXISTS `idx_property_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_property_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `unit_number` varchar(20) DEFAULT NULL,
  `tax_year` int(4) DEFAULT NULL,
  `tax_amount` decimal(12,2) DEFAULT NULL,
  `remark` text,
  `feature_exterior` text,
  `feature_interior` text,
  `amenities` text,
  `assoc_fee` float DEFAULT NULL,
  `virtual_tour` text,
  `area` float DEFAULT NULL,
  `imagens` text,
  `address_map` varchar(250) NOT NULL,
  `date_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sysid` (`sysid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=482026 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idx_property_geocode`
--

DROP TABLE IF EXISTS `idx_property_geocode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_property_geocode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) NOT NULL DEFAULT '0',
  `geocode_id` int(11) NOT NULL DEFAULT '0',
  `lat` decimal(12,7) DEFAULT '0.0000000',
  `lng` decimal(12,7) DEFAULT '0.0000000',
  `location` point DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sysid` (`sysid`) USING BTREE,
  KEY `fk_idx_propety_has_idx_geocode_idx_geocode1_idx` (`geocode_id`) USING BTREE,
  KEY `fk_idx_propety_has_idx_geocode_idx_propety1_idx` (`sysid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=476805 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idx_property_pending`
--

DROP TABLE IF EXISTS `idx_property_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_property_pending` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) NOT NULL DEFAULT '0',
  `mls_num` varchar(20) NOT NULL DEFAULT '',
  `date_property` datetime DEFAULT NULL,
  `list_date` int(11) NOT NULL DEFAULT '0',
  `date_close` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `board_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `office_id` int(11) NOT NULL DEFAULT '0',
  `office_seller_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL DEFAULT '0',
  `co_agent_id` int(11) NOT NULL,
  `agent_seller_id` int(11) NOT NULL,
  `co_agent_seller_id` int(11) NOT NULL,
  `address_short` varchar(150) NOT NULL DEFAULT '',
  `address_large` varchar(150) NOT NULL DEFAULT '',
  `price_origin` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `price_sold` int(11) NOT NULL DEFAULT '0',
  `is_commercial` tinyint(1) NOT NULL DEFAULT '0',
  `is_rental` tinyint(1) NOT NULL DEFAULT '0',
  `year` int(4) NOT NULL DEFAULT '0',
  `bed` int(11) NOT NULL DEFAULT '0',
  `bath` int(11) NOT NULL DEFAULT '0',
  `baths_half` int(11) NOT NULL DEFAULT '0',
  `img_cnt` int(11) NOT NULL DEFAULT '0',
  `image` varchar(50) NOT NULL DEFAULT '',
  `img_date` datetime DEFAULT NULL,
  `st_number` int(11) NOT NULL DEFAULT '0',
  `st_name` varchar(100) NOT NULL DEFAULT '',
  `zip` int(11) NOT NULL DEFAULT '0',
  `sqft` float NOT NULL DEFAULT '0',
  `lot_size` int(11) NOT NULL DEFAULT '0',
  `lot_desc` varchar(255) NOT NULL,
  `parking` tinyint(1) NOT NULL DEFAULT '0',
  `parking_desc` varchar(255) NOT NULL,
  `legal_desc` varchar(255) NOT NULL DEFAULT '',
  `county_id` int(11) NOT NULL DEFAULT '0',
  `wv` varchar(255) NOT NULL DEFAULT '',
  `wa` varchar(255) NOT NULL DEFAULT '',
  `area` int(11) NOT NULL DEFAULT '0',
  `more_info` text NOT NULL,
  `condo_unit` int(11) NOT NULL DEFAULT '0',
  `condo_floor` int(11) NOT NULL DEFAULT '0',
  `subdivision` varchar(255) NOT NULL DEFAULT '',
  `complex` varchar(255) NOT NULL DEFAULT '',
  `development` varchar(250) NOT NULL DEFAULT '',
  `condo_hotel` tinyint(1) NOT NULL DEFAULT '0',
  `foreclosure` tinyint(1) NOT NULL DEFAULT '0',
  `boat_dock` tinyint(1) NOT NULL DEFAULT '0',
  `water_view` tinyint(1) NOT NULL DEFAULT '0',
  `water_front` tinyint(1) NOT NULL DEFAULT '0',
  `ocean_front` tinyint(1) NOT NULL DEFAULT '0',
  `furnished` tinyint(1) NOT NULL DEFAULT '0',
  `pets` tinyint(1) NOT NULL DEFAULT '0',
  `pool` tinyint(1) NOT NULL DEFAULT '0',
  `penthouse` tinyint(1) NOT NULL DEFAULT '0',
  `fireplace` tinyint(1) NOT NULL,
  `tw` tinyint(1) NOT NULL DEFAULT '0',
  `golf` tinyint(1) NOT NULL DEFAULT '0',
  `tennis` tinyint(1) NOT NULL DEFAULT '0',
  `short_sale` tinyint(1) NOT NULL DEFAULT '0',
  `oh_info` text NOT NULL,
  `guest_house` tinyint(1) NOT NULL,
  `gated_community` tinyint(1) NOT NULL DEFAULT '0',
  `unit_floor` int(2) NOT NULL,
  `equestrian` int(2) NOT NULL,
  `eq_num_barns` int(2) NOT NULL,
  `eq_num_stalls` int(2) NOT NULL,
  `floor` varchar(255) NOT NULL,
  `folio_number` varchar(255) NOT NULL DEFAULT '',
  `fn_muni` int(4) NOT NULL,
  `fn_area` int(4) NOT NULL,
  `fn_section` int(4) NOT NULL,
  `fn_sub` int(4) NOT NULL,
  `style` varchar(255) NOT NULL DEFAULT '',
  `date_create` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `date_proccess` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `validate_status` int(11) NOT NULL DEFAULT '0',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `rg_id` int(11) NOT NULL,
  `adom` int(11) NOT NULL DEFAULT '0',
  `available_date` datetime DEFAULT NULL,
  `validate_image` int(1) NOT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `status_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sysid` (`sysid`)
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idx_property_sold`
--

DROP TABLE IF EXISTS `idx_property_sold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idx_property_sold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) NOT NULL DEFAULT '0',
  `mls_num` varchar(20) NOT NULL DEFAULT '',
  `date_property` datetime DEFAULT NULL,
  `list_date` int(11) NOT NULL DEFAULT '0',
  `date_close` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `board_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `office_id` int(11) NOT NULL DEFAULT '0',
  `office_seller_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL DEFAULT '0',
  `co_agent_id` int(11) NOT NULL,
  `agent_seller_id` int(11) NOT NULL,
  `co_agent_seller_id` int(11) NOT NULL,
  `address_short` varchar(150) NOT NULL DEFAULT '',
  `address_large` varchar(150) NOT NULL DEFAULT '',
  `price_origin` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `price_sold` int(11) NOT NULL DEFAULT '0',
  `is_commercial` tinyint(1) NOT NULL DEFAULT '0',
  `is_rental` tinyint(1) NOT NULL DEFAULT '0',
  `year` int(4) NOT NULL DEFAULT '0',
  `bed` int(11) NOT NULL DEFAULT '0',
  `bath` int(11) NOT NULL DEFAULT '0',
  `baths_half` int(11) NOT NULL DEFAULT '0',
  `img_cnt` int(11) NOT NULL DEFAULT '0',
  `image` varchar(50) NOT NULL DEFAULT '',
  `img_date` datetime DEFAULT NULL,
  `st_number` int(11) NOT NULL DEFAULT '0',
  `st_name` varchar(100) NOT NULL DEFAULT '',
  `zip` int(11) NOT NULL DEFAULT '0',
  `sqft` float NOT NULL DEFAULT '0',
  `lot_size` int(11) NOT NULL DEFAULT '0',
  `lot_desc` varchar(255) NOT NULL,
  `parking` tinyint(1) NOT NULL DEFAULT '0',
  `parking_desc` varchar(255) NOT NULL,
  `legal_desc` varchar(255) NOT NULL DEFAULT '',
  `county_id` int(11) NOT NULL DEFAULT '0',
  `wv` varchar(255) NOT NULL DEFAULT '',
  `wa` varchar(255) NOT NULL DEFAULT '',
  `area` int(11) NOT NULL DEFAULT '0',
  `more_info` text NOT NULL,
  `condo_unit` int(11) NOT NULL DEFAULT '0',
  `condo_floor` int(11) NOT NULL DEFAULT '0',
  `subdivision` varchar(255) NOT NULL DEFAULT '',
  `complex` varchar(255) NOT NULL DEFAULT '',
  `development` varchar(250) NOT NULL DEFAULT '',
  `condo_hotel` tinyint(1) NOT NULL DEFAULT '0',
  `foreclosure` tinyint(1) NOT NULL DEFAULT '0',
  `boat_dock` tinyint(1) NOT NULL DEFAULT '0',
  `water_view` tinyint(1) NOT NULL DEFAULT '0',
  `water_front` tinyint(1) NOT NULL DEFAULT '0',
  `ocean_front` tinyint(1) NOT NULL DEFAULT '0',
  `furnished` tinyint(1) NOT NULL DEFAULT '0',
  `pets` tinyint(1) NOT NULL DEFAULT '0',
  `pool` tinyint(1) NOT NULL DEFAULT '0',
  `penthouse` tinyint(1) NOT NULL DEFAULT '0',
  `fireplace` tinyint(1) NOT NULL,
  `tw` tinyint(1) NOT NULL DEFAULT '0',
  `golf` tinyint(1) NOT NULL DEFAULT '0',
  `tennis` tinyint(1) NOT NULL DEFAULT '0',
  `short_sale` tinyint(1) NOT NULL DEFAULT '0',
  `oh_info` text NOT NULL,
  `guest_house` tinyint(1) NOT NULL,
  `gated_community` tinyint(1) NOT NULL DEFAULT '0',
  `unit_floor` int(2) NOT NULL,
  `equestrian` int(2) NOT NULL,
  `eq_num_barns` int(2) NOT NULL,
  `eq_num_stalls` int(2) NOT NULL,
  `floor` varchar(255) NOT NULL,
  `folio_number` varchar(255) NOT NULL DEFAULT '',
  `fn_muni` int(4) NOT NULL,
  `fn_area` int(4) NOT NULL,
  `fn_section` int(4) NOT NULL,
  `fn_sub` int(4) NOT NULL,
  `style` varchar(255) NOT NULL DEFAULT '',
  `date_create` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `date_proccess` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `validate_status` int(11) NOT NULL DEFAULT '0',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `rg_id` int(11) NOT NULL,
  `adom` int(11) NOT NULL DEFAULT '0',
  `available_date` datetime DEFAULT NULL,
  `validate_image` int(1) NOT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `status_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sysid` (`sysid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) DEFAULT NULL,
  `mls` varchar(255) DEFAULT NULL,
  `st` varchar(50) DEFAULT NULL,
  `class_table` varchar(255) DEFAULT NULL,
  `rets_icounter` int(11) DEFAULT NULL,
  `rets_idate` datetime DEFAULT NULL,
  `rets_date_property` datetime DEFAULT NULL,
  `rets_last_updated` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `s3_counter` int(11) DEFAULT NULL,
  `s3_images` text,
  `s3_process_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sysid` (`sysid`) USING BTREE,
  KEY `index_counter` (`s3_counter`) USING BTREE,
  KEY `index_date_property` (`rets_date_property`) USING BTREE,
  KEY `index_st` (`st`) USING BTREE,
  KEY `index_mls` (`mls`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=967943 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images_error`
--

DROP TABLE IF EXISTS `images_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images_error` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sysid` int(11) DEFAULT NULL,
  `mls` varchar(255) DEFAULT NULL,
  `class_table` varchar(255) DEFAULT NULL,
  `rets_icounter` int(11) DEFAULT NULL,
  `rets_idate` datetime DEFAULT NULL,
  `rets_last_updated` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `s3_counter` int(11) DEFAULT NULL,
  `s3_images` text,
  `s3_process_date` datetime DEFAULT NULL,
  `response_msg` text,
  PRIMARY KEY (`id`),
  KEY `index_sysid` (`sysid`) USING BTREE,
  KEY `index_mls` (`mls`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_activity`
--

DROP TABLE IF EXISTS `log_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origen_class` varchar(200) DEFAULT NULL,
  `sysid` int(11) DEFAULT NULL,
  `mls` varchar(50) DEFAULT NULL,
  `meta_key` text,
  `meta_values` text,
  `status_change` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `date_process` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sysid` (`sysid`) USING BTREE,
  KEY `index_mls` (`mls`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` bigint(20) NOT NULL DEFAULT '0',
  `inserted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-16 18:11:43
