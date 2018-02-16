defmodule DgtidxWeb.PageController do
  use DgtidxWeb, :controller

  def index(conn, _params) do
    #Dgtidx.Worker.publish(Poison.encode!(%{"age" => 27, "name" => "Devin Torres"}))
    #Dgtidx.Worker.publish(Poison.encode!(%{"InternetYN " => "1","OtherExpenses " => "","CoListAgent_MUI " => "","ListAgentMLSID " => "0668898","NumParcels " => "","LotDescription " => "1/4 To Less Than 1/2 Acre Lot","CoListAgentDirectWorkPhone " => "","DXORIGLPID " => "0668898","TypeofOwnership " => "","TotalNumofUnitsInComplex " => "","UsageDescription " => "","HeatingDescription " => "Central Heat","SellingAgentPublicId " => "","UnitNumber " => "","ListingType " => "Exclusive Right","PropertyType " => "Single Family","AgentAlternatePhone " => "954-394-4545","UnfurnSeasonalRent " => "","REOYN " => "0","ComptoBuyersAgent " => "3%","ExpInclLawnMaintenanceYN " => "","DockInformation " => "","Location " => "","NumStories " => "","PropertyDetachedYN " => "","CommonAreaMaintAmount " => "","UtilityRoomDimension " => "","FurnOffSeasonRent " => "","SellingOfficeName " => "","WaterfrontPropertyYN " => "0","Jurisdiction " => "","ParcelNumber " => "494122150640","TypeofTrees " => "","GasDescription " => "","MembershipPurchRqdYN " => "0","NumSeats " => "","RentStatusFebruary " => "","RentStatusSeptember " => "","NumBays " => "","CoSellingOfficeMLSID " => "","RentStatusNovember " => "","ManufacturedHomeSize " => "","Ownership " => "","TypeofBuilding " => "","OtherIncomeExpense " => "","TotalMortgage " => "","ExpInclJanitorYN " => "","DesignDescription " => "One Story","WaterviewDescription " => "","DiningRoomDimensions " => "","Area " => "3740","Matrix_Unique_ID " => "458974456","ParkingSpaceNumber " => "","CoListAgentMLSID " => "","ClosePrice " => "","CountyOrParish " => "Broward County","ExpInclMaintandRepairYN " => "","SecurityInformation " => "","AvailableDocuments " => "","ZoningInformation " => "RS-4","VacancyRate " => "","CeilingDescription " => "","SaleTerms " => "","ExpInclInsuranceYN " => "","AvailableDate " => "","NumOffices " => "","NumLeasesYear " => "","CoSellingAgent_MUI " => "","PhotoCount " => "47","DepositInformation " => "","RoofDescription " => "Other Roof","ReimbursableSqFt " => "","CoSellingAgentDirectWorkPhone " => "","SubdivisionName " => "Boulevard West 92-19 B","FeeDescription " => "","CloseDate " => "","AcreageDescription " => "","MasterBathroomDescription " => "Shower Only","SubdivisionInformation " => "Public Road,Sidewalks,Street Lights","MaintenanceIncludes " => "","ExpirationDate " => "","OccupancyPercentage " => "","CountyLandCode " => "","NumUnits " => "","CoSellingAgentFullName " => "","MaintenanceChargeMonth " => "","VarDualRateCompYN " => "0","MiddleSchool " => "","FurnSeasonalRent " => "","PossessionInformation " => "Funding","SellingOffice_MUI " => "","ListOffice_MUI " => "1007287","LeaseTermInfo " => "","ApproxSqftTotalArea " => "2461","ListOfficeMLSID " => "1337","MilestoBeach " => "","OccupancyInformation " => "Owner Occupied","ListingContractDate " => "","OpenHouseUpcoming " => "","FillDescription " => "","MiscellaneousInformation " => "","ExpInclSuppliesYN " => "","PriceAcre " => "","ConstructionType " => "Cbs Construction","CoAgentLicenseNum " => "","BuildingIncludes " => "","AssociationFee " => "","MainLivingArea " => "","MLSNumber " => "F10094348","DOM " => "","FloorDescription " => "Carpeted Floors,Ceramic Floor","Style " => "Pool Only","TypeofProperty " => "Single","ElementarySchool " => "","UnfurnAnnualRent " => "","CoSellingOffice_MUI " => "","RecLeaseMonth " => "","TaxYear " => "2016","PoolYN " => "1","TownshipRange " => "4941","NumInteriorLevels " => "","BuildingNameNumber " => "","SqFtLAofGuestHouse " => "","StatusChangeTimestamp " => "2017-11-15T22:23:55.907","ExpInclManagementYN " => "","FolioNum3rdParcel " => "","MaintandRepairsExpense " => "","WaterDescription " => "Municipal Water","CoSellingOfficeName " => "","SupplementCount " => "","CarportDescription " => "","StyleofProperty " => "","GrossOperatingIncome " => "","CommonAreaMaintIncludes " => "","Usage " => "","StreetDirPrefix " => "","ListPrice " => "324900.00","ADOM " => "90","PriceUnit " => "","SurfaceDescription " => "","ExpInclAcctgLegalYN " => "","OnSiteUtilities " => "","WindowsTreatment " => "","EnvironmentalAudit " => "","NumCarportSpaces " => "","City " => "Lauderhill","CoListOfficePhone " => "","ApplicationFee " => "","PropTypeTypeofBuilding " => "","WaterView " => "","SqFtTotal " => "","CoListOffice_MUI " => "","TypeofSoil " => "","Status " => "Active","OwnersName " => "","ColumnDescription " => "","ConvertibleBedroomYN " => "","NetOperatingIncome " => "","PropertySqFt " => "7267","TypeofGoverningBodies " => "","GroundCover " => "","FurnAnnualRent " => "","AddressInternetDisplay " => "","RentStatusMay " => "","PatioBalconyDimensions " => "","InsuranceExpense " => "","NumGarageSpaces " => "2","LandLeaseAmount " => "","RenewableRentalYN " => "","SellingAgent_MUI " => "","ExpInclGasOilYN " => "","TotalAssumableLoans " => "","StreetNumber " => "","ACPercentage " => "","TotalNumofUnitsInBuildin " => "","ListOfficeName " => "Berkshire Hathaway FL Realty","MiscellaneousExpense " => "","CoolingDescription " => "Central Cooling","SpecialInformation " => "As Is","TypeofAssociation " => "None","TotalAcreage " => "","PostalCodePlus4 " => "4919","PostalCode " => "33319","ManufacturedHomeMiscell " => "","MoveInDollars " => "","BalconyPorchandorPatioYN " => "","YearBuilt " => "1978","ExpInclAdvLicPermitYN " => "","MaximumCeilingHeight " => "","MunicipalCode " => "","SellingOfficePhone " => "","UtilityExpense " => "","DoorHeight " => "","LotFrontage " => "","SellerContributionsAmt " => "","ParkingDescription " => "Driveway","PoolDimensions " => "30X16","StreetName " => "","SupplementModificationTimestamp " => "","IDXOptInYN " => "1","ShortSaleYN " => "0","TotalMoveInDollars " => "","DXORIGMLNO " => "F10094348","FurnishedInfoList " => "","CoListAgentFullName " => "","TotalExpenses " => "","ExpInclReplaceReserveYN " => "","ParkingRestrictions " => "","SubdivisionComplexBldg " => "Boulevard West 92-19 B","AssumableYN " => "","DXORIGOFFCODE " => "1337","RailDescription " => "","LocationofProperty " => "","CoSellingAgentMLSID " => "","WaterfrontDescription " => "","RenewalCommission " => "","OriginalListPrice " => "339000.00","RentStatusJuly " => "","Design " => "Detached","UnitFloorLocation " => "","CoListOfficeName " => "","CoSellingOfficePhone " => "","ExpInclWaterSewerYN " => "","RentStatusApril " => "","TrashExpense " => "","ListAgentFullName " => "Donna Shoucair","RoomCount " => "0","MinimumLeasePeriod " => "","NumLoadingDoors " => "","RealEstateTaxes " => "","RentStatusAugust " => "","ApprovalInformation " => "","InteriorFeatures " => "Closet Cabinetry,Split Bedroom","RentIncludes " => "","SellingAgentMLSID " => "","SewerDescription " => "Municipal Sewer","TaxInformation " => "Tax Reflects Homestead Tax","UtilitiesAvailable " => "","GrossRentIncome " => "","AccountingandLegalExpens " => "","StyleofBusiness " => "","LandImprovements " => "","RoomsDescription " => "Family Room,Storage Room","SellingAgentFullName " => "","RentStatusJune " => "","ExpInclPoolServiceYN " => "","SubdivisionNumber " => "","CableAvailableYN " => "","SeparateMeterYN " => "","AgentLicenseNum " => "0668898","TotalFloorsInBuilding " => "","FireProtection " => "","VirtualTour " => "https://tours.southfloridavirtualtour.com/905827?idx=1","ExpInclRetaxYN " => "","DiningAreaDimensions " => "","View " => "Garden View","BoardIdentifier " => "Greater Ft Lauderdale REALTORS","RentStatusJanuary " => "","DXORIGMLSID " => "FLL","PropertyDescription " => "","EaveHeight " => "","ApproximateLotSize " => "","SqFtLivArea " => "1916","Directions " => "GPS","RentalDepositIncludes " => "","BathsFull " => "2","Miscellaneous " => "","PetRestrictions " => "","SellingOfficeMLSID " => "","DevelopmentName " => "","RentPeriod " => "","ExpInclMiscellaneousYN " => "","TaxAmount " => "4608","BedsTotal " => "3","AVM " => "1","TotalUnits " => "","MilestoExpressway " => "","ShowingInstructions " => "Showing Time","OwnerAgentYN " => "0","OwnersPhone " => "","TermsAvailable " => "","FurnishedInfoSold " => "","GrossScheduledIncome " => "","LegalDescription " => "BOULEVARD WEST 92-19 B LOT 64 BLK 1","ExpInclTrashYN " => "","NumCeilingFans " => "","ExpInclElectricYN " => "","YearBuiltDescription " => "Resale","SellingAgentEmail " => "","ElevationAboveSeaLevel " => "","GuestHouseDescription " => "","PoolDescription " => "Below Ground Pool","RoadFrntgDescription " => "","GeographicArea " => "Tamarac/Snrs/Lderhl (3650-3670;3730-3750;3820-3850)","Section " => "22","ElectricService " => "","DiningDescription " => "Eat-In Kitchen,Formal Dining,Kitchen Dining","LotDepth " => "","Remarks " => "BEAUTIFUL 3/2 POOL HOME/SCREENED PATIO/FORMAL LIVING AND DINING ROOM/EAT-IN KITCHEN/LARGE FAMILY ROOM/ SPLIT BEDROOM PLAN/LOCATED CLOSE TO SHOPPING /HIGHWAYS/PARKS/MOTIVATED SELLER","PendingDate " => "","PetsAllowedYN " => "","TransactionType " => "","BathsHalf " => "","PhotoModificationTimestamp " => "2017-11-16T09:37:10.940","ForLeaseYN " => "","ExteriorFeatures " => "Extra Building/Shed,Fence,Exterior Lighting,Screened Porch","DeedRestrictions " => "","PriceSqFt " => "","SourceofExpenses " => "","MaintenanceFeeIncludes " => "","RentStatusDecember " => "","AgentsOfficeExtension " => "","SellingAgentDirectWorkPhone " => "","HousingOlderPersonsAct " => "No HOPA","GarageDescription " => "","SpaYN " => "","MiscellaneousImprovements " => "","ImprovementHeightCOM " => "","AddlMoveInCostYN " => "","CoListAgentEmail " => "","StateOrProvince " => "FL","OfficeFaxNumber " => "954-752-5161","GroundCoverDescription " => "","ServiceExpense " => "","RentalPaymentIncludes " => "","AssocFeePaidPer " => "","ListAgentEmail " => "donnashou@aol.com","NumTenants " => "","InformationAvailable " => "","MatrixModifiedDT " => "2018-02-13T16:00:17.587","ExpInclPropertyTaxYN " => "","ExpenseAmount " => "","SupplyExpense " => "","ExpInclExterminationYN " => "","MembershipPurchaseFee " => "","AdvertisingExpenses " => "","CoSellingAgentEmail " => "","ComprehensivePlanUse " => "","ModelName " => "","IncExpStatementPeriod " => "","ComptoNonRepresentative " => "1%","NumFloors " => "","UnitView " => "","OffMarketDate " => "","TypeofContingencies " => "","SeniorHighSchool " => "","Blogging " => "0","DenDimensions " => "","Restrictions " => "Ok To Lease","NumToilets " => "","ComplexName " => "","LotorTrackNum " => "","Amenities " => "","FolioNum2ndParcel " => "","LotSqFootage " => "7267","AddressonInternet " => "0","SprinklerDescription " => "Other Sprinkler","RoadTypeDescription " => "","OriginalEntryTimestamp " => "2017-11-15T22:23:55.907","RentStatusMarch " => "","EquipmentAppliances " => "Dishwasher,Disposal,Dryer,Electric Range,Refrigerator,Washer","ExpectedClosingDate " => "","UnitDesign " => "","CoListOfficeMLSID " => "","NumBuildings " => "","MaximumLeasableSqft " => "","NumMeters " => "","NumEmployees " => "","UnitCount " => "","ForSaleYN " => "","SellingAgentLicenseNum " => "","PropertyTypeInformation " => "","DockHeight " => "","WaterfrontFrontage " => "","AdditionalFurnishedInfo " => "","CoSellAgentLicenseNum " => "","RentStatusOctober " => "","SellerContributionsYN " => "","BedroomDescription " => "Other","TermsConsidered " => "Conventional,FHA-Va Approved","WaterAccess " => "","UnfurnOffSeasonRent " => "","NumParkingSpaces " => "","BrokerRemarks " => "","ListAgentDirectWorkPhone " => "954-394-4545","FrontExposure " => "South","MinSFLivingAreaReqmt " => "","ListOfficePhone " => "954-369-0200","ComptoTransactionBroker " => "3%","MinimumNumofDaysforLease " => "","Development " => "","EfficiencyYN " => "","BoatDockAccommodates " => "","ListAgent_MUI " => "1021011","ParcelNumberMLX " => "0640"}))
    render conn, "index.html"
  end
end
