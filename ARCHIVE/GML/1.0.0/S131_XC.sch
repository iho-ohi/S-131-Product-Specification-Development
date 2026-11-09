<?xml version="1.0" encoding="UTF-8"?>
<!-- ============================================================================================= -->
<!--
  © Copyright 2023 IHO
	Prepared by Portolan Sciences LLC. Prepared under IHO contract.
	
	License
  Certain parts of the text of this document refer to or are based on the standards of the International
  Organization for Standardization (ISO). The ISO standards can be obtained from any ISO member and from the
  Web site of the ISO Central Secretariat at www.iso.org.
    
  Permission to copy and distribute this document is hereby granted provided that this notice is retained
  on all copies, and that IHO & NOAA are credited when the material is redistributed or used in part or
	whole in derivative works.

	Disclaimer
	This work is provided without warranty, expressed or implied, that it is complete or accurate or that it
	is fit for any particular purpose.  All such warranties are expressly disclaimed and excluded.
	
	Document history
	Version  1.0.0: For S-131 Edition 1.0.0
    Build 20221231  Initial version, for S-131 Edition 1.1.0 (Raphael Malyankar, Portolan Sciences LLC)
      There is no version of this file preceding 1.0.0. The version number has been selected to synchronize
      with the corresponding S-131 version.
	-->
<!-- ============================================================================================= -->
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" schemaVersion="1.0.0-20221231" queryBinding="xslt">
  <!--<sch:ns prefix="fn" uri="http://www.w3.org/2005/xpath-functions"/>-->
  <!-- For clarity, this file lists all the namespaces in the exchange catalog xsd, though not all
       are used in rules.
   -->
  <sch:ns prefix="cat" uri="http://standards.iso.org/iso/19115/-3/cat/1.0"/>
  <sch:ns prefix="cit" uri="http://standards.iso.org/iso/19115/-3/cit/2.0"/>
  <sch:ns prefix="gco" uri="http://standards.iso.org/iso/19115/-3/gco/1.0"/>
  <sch:ns prefix="gcx" uri="http://standards.iso.org/iso/19115/-3/gcx/1.0"/>
  <sch:ns prefix="gex" uri="http://standards.iso.org/iso/19115/-3/gex/1.0"/>
  <sch:ns prefix="gmw" uri="http://standards.iso.org/iso/19115/-3/gmw/1.0"/>
  <sch:ns prefix="lan" uri="http://standards.iso.org/iso/19115/-3/lan/1.0"/>
  <sch:ns prefix="mco" uri="http://standards.iso.org/iso/19115/-3/mco/1.0"/>
  <sch:ns prefix="mmi" uri="http://standards.iso.org/iso/19115/-3/mmi/1.0"/>
  <sch:ns prefix="mri" uri="http://standards.iso.org/iso/19115/-3/mri/1.0"/>
  <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
  <sch:ns uri="http://www.iho.int/s100/xc/5.0" prefix="S100XC"/>
  <sch:ns uri="http://www.iho.int/s100/se/5.0" prefix="S100SE"/>

  <sch:title>Schematron validation rules for S-131 Exchange Catalogues. Supplement to validation rules in the generic S-100 schemas distribution.</sch:title>
  <sch:p>Product-specific checks for S-131. The rules are written for exchange sets containing at least one S-131 dataset and should not be applied if such is not the case.</sch:p>

  <!--   Product-specific validation rules for S100_ExchangeCatalogue  -->
  <sch:pattern id="S131.S100_ExchangeCatalogue" fpi="S131.14">
    <sch:title>S-131 restrictions for S100_ExchangeCatalogue - mandatory elements</sch:title>
    <sch:rule context="/S100XC:S100_ExchangeCatalogue" role="warning">
      <sch:assert test="S100XC:identifier">
        S100_ExchangeCatalogue.identifier is required in S-131.
      </sch:assert>
      <sch:assert test="S100XC:contact">
        S100_ExchangeCatalogue.contact is required in S-131.
      </sch:assert>
      <sch:assert test="S100XC:productSpecification">
        S100_ExchangeCatalogue.productSpecification is required in S-131.
      </sch:assert>
    </sch:rule>
  </sch:pattern>

  <!--  Product-specific validation rules for S100_ExchangeCatalogueIdentifier  -->

  <!--  Product-specific validation rules for S100_ExchangeCataloguePointOfContact  -->

  <!--   Product-specific validation rules for S100_DatasetDiscoveryMetadata   -->
  <sch:pattern id="S131.I0" fpi="S131.init.0">
    <sch:title>Initialization checking (1)</sch:title>
    <sch:rule context="/S100XC:S100_ExchangeCatalogue" id="S131.I0.R1">
      <sch:assert test="S100XC:datasetDiscoveryMetadata/S100XC:S100_DatasetDiscoveryMetadata" role="fatal">
        At least one dataset discovery block is required
      </sch:assert>
    </sch:rule>
    <sch:rule context="/S100XC:S100_ExchangeCatalogue/S100XC:datasetDiscoveryMetadata/S100XC:S100_DatasetDiscoveryMetadata" id="S131.I0.R2">
      <sch:p>This rule will produce superfluous warnings for mixed exchange sets with discovery blocks for non-S-131 datasets.</sch:p>
      <sch:assert test="S100XC:productSpecification" role="warning" id="S131.I0.R2.A1">
        Dataset discovery metadata block without product specification information (may be non-S-131 dataset without this requirement?) [<sch:value-of select="S100XC:fileName"/>]
      </sch:assert>
      <sch:report test="S100XC:productSpecification[S100XC:productIdentifier != 'S-131']" role="information" id="S131.I0.R2.A2">
        Exchange catalog contains dataset discovery block for non-S-131 dataset [<sch:value-of select="S100XC:fileName"/>, <sch:value-of select="S100XC:productSpecification/S100XC:productIdentifier"/>]
      </sch:report>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="S131.S100_DatasetDiscoveryMetadata" fpi="S131.14.2.2">
    <sch:title>S-131 restrictions for S100_DatasetDiscoveryMetadata - mandatory and prohibited elements</sch:title>
    <sch:rule context="/S100XC:S100_ExchangeCatalogue/S100XC:datasetDiscoveryMetadata/S100XC:S100_DatasetDiscoveryMetadata[S100XC:productSpecification/S100XC:productIdentifier = 'S-131']">
      <sch:assert test="S100XC:datasetID" role="error">
        S100_DatasetDiscoveryMetadata.datasetID is required. [<sch:value-of select="S100XC:fileName"/>]
      </sch:assert>
      <sch:assert test="S100XC:editionNumber" role="error">
        S100_DatasetDiscoveryMetadata.editionNumber is required. [<sch:value-of select="S100XC:fileName"/>]
      </sch:assert>
      <sch:assert test="S100XC:dataCoverage" role="error">
        S100_DatasetDiscoveryMetadata.dataCoverage is required. [<sch:value-of select="S100XC:fileName"/>]
      </sch:assert>
      <sch:report test="S100XC:updateNumber|S100XC:updateApplicationDate|S100XC:otherLocale|S100XC:referenceID" role="warning">
        <sch:value-of select="local-name()"/> updateNumber, updateApplicationDate, otherLocale, referenceID are not permitted in S-131 [<sch:value-of select="S100XC:fileName"/>]
      </sch:report>
      <sch:report test="S100XC:dataCoverage/S100XC:optimumDisplayScale|S100XC:dataCoverage/S100XC:maximumDisplayScale|S100XC:dataCoverage/S100XC:minmumDisplayScale"  role="warning">
        <sch:value-of select="local-name()"/> optimumDisplayScale, maximumDisplayScale, minmumDisplayScale are not permitted in S-131 [<sch:value-of select="S100XC:fileName"/>]
      </sch:report>
      <sch:report test="S100XC:dataCoverage/S100XC:temporalExtent" role="warning">
        <sch:value-of select="local-name()"/>.dataCoverage.temporalExtent is not permitted in S-131 [<sch:value-of select="S100XC:fileName"/>]
      </sch:report>
      <sch:report test="S100XC:dataCoverage/S100XC:approximateGridResolution" role="warning">
        <sch:value-of select="local-name()"/>.dataCoverage.approximateGridResolution is not permitted in S-131 [<sch:value-of select="S100XC:fileName"/>]
      </sch:report>
      <sch:report test="S100XC:purpose[(text() = 'delta')]" role="error">
        <sch:value-of select="local-name()"/>.purpose value 'delta' is not allowed in S-131 [<sch:value-of select="S100XC:fileName"/>]
      </sch:report>
      <sch:assert test="S100XC:encodingFormat[(text() = 'GML')]" role="error">
        <sch:value-of select="local-name()"/>.encodingFormat must be 'HDF5' [<sch:value-of select="S100XC:fileName"/>]
      </sch:assert>
      <sch:assert test="S100XC:productSpecification/S100XC:name" role="warning">
        <sch:value-of select="local-name()"/>.productSpecification.name must be provided [<sch:value-of select="S100XC:fileName"/>]
      </sch:assert>
      <sch:assert test="S100XC:productSpecification/S100XC:version" role="warning">
        <sch:value-of select="local-name()"/>.productSpecification.version must be provided [<sch:value-of select="S100XC:fileName"/>]
      </sch:assert>
      <sch:report test="S100XC:productSpecification/S100XC:compliancyCategory[(text() != 'category4')]" role="warning">
        <sch:value-of select="local-name()"/>.productSpecification.compliancyCategory must be category4 [<sch:value-of select="S100XC:fileName"/>]
      </sch:report>
    </sch:rule>
  </sch:pattern>

  <!--   Product-specific validation rules for S100_SupportFileDiscoveryMetadata   -->
  <sch:pattern id="S131.S100_SupportFileDiscoveryMetadata" fpi="S131.14.2.3">
    <sch:title>S-131 restrictions for S100_SupportFileDiscoveryMetadata - mandatory and prohibited elements</sch:title>
    <sch:rule  context="/S100XC:S100_ExchangeCatalogue/S100XC:supportFileDiscoveryMetadata/S100XC:S100_SupportFileDiscoveryMetadata">
      <sch:report test="S100XC:otherDataTypeDescription" role="warning">
        <sch:value-of select="local-name()"/>.otherDataTypeDescription is not permitted in S-131 support file discovery block [<sch:value-of select="S100XC:fileName"/>] (check if this file supports a different PS)
      </sch:report>
      <sch:let name="SUPPORT_DT" value="concat(S100XC:dataType, '')"/>
      <sch:assert test="('XML' = $SUPPORT_DT) or ('HTML' = $SUPPORT_DT) or ('ASCII' = $SUPPORT_DT) or ('TIFF' = $SUPPORT_DT)" role="warning">
        <sch:value-of select="local-name()"/>.supportFileFormat (<sch:value-of select="S100XC:supportFileFormat"/>) must be XML/HTML/ASCII/TIFF in S-131 support file discovery block [<sch:value-of select="S100XC:fileName"/>] (check if this file supports a different PS)
      </sch:assert>
    </sch:rule>
  </sch:pattern>

</sch:schema>