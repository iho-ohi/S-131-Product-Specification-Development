<?xml version="1.0" encoding="UTF-8"?>
<!--    =============================================================================================
    Copyright, license, and disclaimer
    © Copyright 2026 Portolan Sciences LLC (PSCI)
    
    License
    Permission to copy and distribute this document is hereby granted provided that this notice is retained
    on all copies, and that the contributors are credited when the material is redistributed or used in
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
    ============================================================================================= -->
<!--    =============================================================================================
    Version 0.1-20260106: Initial version - RMM - Raphael Malyankar (Portolan Sciences LLC)
    Description: Schematron rule to check for existence of xsi:schemaLocation attributes on root elements of XML documents.
    Note       : Validation using Schematron rule files and XML schemas (XSD files) are in principle separate. XML tools
      may apply them in separate steps each requring manual triggering or in a pipeline, depending on the method used to
      validate instance documents.
    ============================================================================================= -->

<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <sch:ns uri="http://www.w3.org/2001/XMLSchema-instance" prefix="xsi"/>
    <sch:pattern id="check.schemaLocation">
        <sch:title>Check for existence of xsi:schemaLocation attribute on root element</sch:title>
        <sch:p>Note that this rule only checks for the existence of a schemaLocation attribute and does not validate the content of the
            schemaLocation attribute. In other words it does not check if the schema location is for the namespace of the root element.</sch:p>
        <sch:rule context="/*">
            <sch:assert test="@xsi:schemaLocation">No schemaLocation attribute on root element <sch:value-of select="name(/*)"/>.</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>