<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process" schemaVersion="1.0.0-20221231">
<!-- ============================================================================================= -->
<!-- Schematron rules for validation of S-31 GML datasets.                                      -->
<!-- ============================================================================================= -->
    
<!-- =============================================================================================
Copyright, license, and disclaimer
© Copyright 2022 IHO

License
Certain parts of this document refer to or are based on the standards, documents, schemas, or other material
of the International Organization for Standardization (ISO), Open Geospatial Consortium (OGC), International
Hydrographic Organization / Organisation Hydrographique Internationale (IHO/OHI), or International
Association of Marine Aids to Navigation and Lighthouse Authorities / Association Internationale de
Signalisation Maritime (IALA/AISM).
The ISO material can be obtained from any ISO member and from the Web site of the ISO Central Secretariat
at www.iso.org.
The OGC material can be obtained from the OGC Web site at www.opengeospatial.org.
The IHO material can be obtained from the IHO Web site at www.iho.int or from the International Hydrographic
Bureau.
The IALA material can be obtained from the IALA Secretariat or the IALA Web site at www.iala-aism.org.

Permission to copy and distribute this document is hereby granted provided that this notice is retained
on all copies, and that IHO and IALA, and GLA are credited when the material is redistributed or used in
part or whole in derivative works.
Redistributions in binary form must reproduce this notice in the documentation and/or other materials
provided with the distribution.

Disclaimer
This work is provided by the copyright holders and contributors "as is" and any express or implied warranties,
including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose
are disclaimed. In no event shall the copyright owner or contributors be liable for any direct, indirect,
incidental, special, exemplary, or consequential damages (including, but not limited to, procurement of substitute
goods or services; loss of use, data, or profits; or business interruption) however caused and on any theory of
liability, whether in contract, strict liability, or tort (including negligence or otherwise) arising in any way
out of the use of this software, even if advised of the possibility of such damage.

Document history
Version 1.0.0	2022-12-31	Raphael Malyankar	Initial version
================================================================================================== -->
<!-- Note: This is a set of basic consistency checks. It is not an implementation of Annex D (Validation checks).
  It is designed for base datasets only.
-->

  <sch:ns prefix="gml" uri="http://www.opengis.net/gml/3.2"/>
  <sch:ns prefix="S100" uri="http://www.iho.int/s100gml/5.0"/>
  <sch:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>
  <sch:ns uri="http://www.iho.int/S131/1.0" prefix="S131"/>

  <sch:title>Schematron validation rules for basic integrity checks of S-131 datasets</sch:title>
  <sch:pattern id="VALIDATE_ASSOCIATIONS">
    <sch:title>Validation rule to check that objects referenced in associations exist in the dataset.</sch:title>
    <!-- Rule permits references as either "#gmlidoftarget" or "gmlidoftarget". -->
    <sch:rule id="CHK_HREFS" context="//*:members/*/*[@xlink:href]" role="warning">
      <sch:let name="HREF" value="string(@xlink:href)"/>
      <sch:let name="HREF_FRAG" value="substring-after($HREF, '#')"/>
      <sch:assert test="exists(//*/*[@gml:id = $HREF  or @gml:id = $HREF_FRAG])">Object with ID '<sch:value-of select="$HREF"/>' not found in dataset [gml:id <sch:value-of select="../@gml:id"/>] </sch:assert>
    </sch:rule>
  </sch:pattern>

    
  <sch:pattern>
    <sch:title>Check presence of spatial refs</sch:title>
    <!-- Rule permits references as either "#gmlidoftarget" or "gmlidoftarget". -->
    <sch:rule id="CHK_SPATIALQ_HREFS" context="//*:members/*/geometry//S100:informationAssociation[@xlink:href]" role="warning">
      <sch:let name="HREF" value="string(@xlink:href)"/>
      <sch:let name="HREF_FRAG" value="substring-after($HREF, '#')"/>
      <sch:assert test="exists(//*:members/*[@gml:id = $HREF or @gml:id = $HREF_FRAG])">Spatial Quality with ID '<sch:value-of select="$HREF"/>' not found in dataset</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="DATEND_DATSTA">
    <sch:title>Date end must be after date start</sch:title>
    <sch:rule id="DATEND_DATSTA_COMP" context="//*:members/*[(count(*:dateEnd) gt 0) and (count(*:dateStart) gt 0)]">
      <sch:let name="DATEND_TYPE" value="local-name(*:dateEnd/*)"/>
      <sch:let name="DATSTA_TYPE" value="local-name(*:dateStart/*)"/>
      <sch:assert test="compare(*:dateEnd/*, *:dateStart/*) = 1">Value of attribute dateEnd (<sch:value-of select="*:dateEnd"/>) must be after dateStart (<sch:value-of select="*:dateStart"/>) [gml:id <sch:value-of select="@gml:id"/>] </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="PERIODCHK1">
    <sch:title>Check that period end and start are both present if either is present.</sch:title>
    <sch:rule id="PEREND_1" context="//*:members/*[(count(*:periodEnd) gt 0) or (count(*:periodStart) gt 0)]">     
      <sch:assert test="exists(*:periodEnd) and exists(*:periodStart) and (count(*:periodEnd) = count(*:periodStart))">Start and end of period are both required if one is present [gml:id <sch:value-of select="@gml:id"/>]</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="PERIODCHK2">
    <sch:title>Check that period end and start use the same components (they are not comparable otherwise)</sch:title>
    <!-- (Rule assumes 0 or 1 period end/start) -->
    <sch:rule id="PERIODSTYPE_1" context="//*:members/*[(count(*:periodEnd) gt 0) and (count(*:periodStart) gt 0)]">     
      <sch:assert test="local-name(*:periodEnd/*) = local-name(*:periodStart/*)">Attribute periodEnd (<sch:value-of select="local-name(*:periodEnd/*)"/>: <sch:value-of select="*:periodEnd"/>) does not have the same components as periodStart (<sch:value-of select="local-name(*:periodStart/*)"/>: <sch:value-of select="*:periodStart"/>) [gml:id <sch:value-of select="@gml:id"/>]</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern id="CADDRESS_NONEMPTY">
    <sch:title>At least one sub-attribute of contact address must be present</sch:title>
    <sch:rule id="CADDRESS.NULLITY" context="//*:contactAddress">
      <sch:assert test="string-length(normalize-space()) gt 0">
        At least one sub-attribute of contact address must be given. [gml:id <sch:value-of select="../@gml:id"/>]
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="REQD.META.DataCoverage">
    <sch:title>Presence of DataCoverage</sch:title>
    <sch:rule id="R.REQD.META.DataCoverage" context="//*:members" role="error">
      <sch:assert test="count(*:DataCoverage) > 0">DataCoverage missing</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern id="REQD.META.SoundingDatum">
    <sch:title>Presence of SoundingDatum</sch:title>
    <sch:rule id="R.REQD.META.SoundingDatum" context="//*:members" role="error">
      <sch:assert test="count(*:SoundingDatum) > 0">SoundingDatum missing</sch:assert>
    </sch:rule>
    </sch:pattern>
  <sch:pattern id="REQD.META.VerticalDatumOfData">
    <sch:title>Presence of VerticalDatumOfData</sch:title>
    <sch:rule id="R.REQD.META.VerticalDatumOfData" context="//*:members" role="error">
      <sch:assert test="count(*:VerticalDatumOfData) > 0">VerticalDatumOfData missing</sch:assert>
    </sch:rule>
    </sch:pattern>
  <sch:pattern id="REQD.META.QualityOfNonbathymetricData">
    <sch:title>Presence of QualityOfNonBathymetricData</sch:title>
    <sch:rule id="R.REQD.META.QualityOfNonbathymetricData" context="//*:members" role="warning">
      <sch:assert test="count(*:QualityOfNonBathymetricData) > 0">QualityOfNonBathymetricData missing</sch:assert>
    </sch:rule>
  </sch:pattern>

</sch:schema>