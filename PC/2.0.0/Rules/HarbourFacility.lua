-- Feature Catalogue Version: 2.0.0 (2019/4/9)
-- Modified for S-131 2.0.0 by IIC 20250107

-- Harbour facility main entry point.
function HarbourFacility(feature, featurePortrayal, contextParameters)
    local viewingGroup = 32410
    local displayPlane = contextParameters.RadarOverlay and 'OverRADAR' or 'UnderRADAR'

    -- =====================
    -- POINT
    -- =====================
    if feature.PrimitiveType == PrimitiveType.Point then
        featurePortrayal:AddInstructions(
            'ViewingGroup:32410;DrawingPriority:12;DisplayPlane:' .. displayPlane
        )
        featurePortrayal:AddInstructions('PointInstruction:131SYMBL3S')

    -- =====================
    -- SURFACE
    -- =====================
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:AddInstructions(
            'ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR'
        )

        -- centroid symbol for area feature (S-131)
        featurePortrayal:AddInstructions('PointInstruction:131INFRM')

        -- boundary portrayal must respect PlainBoundaries
        if contextParameters.PlainBoundaries then
            featurePortrayal:SimpleLineStyle('dash', 0.64, 'CHGRD')
        else
            featurePortrayal:SimpleLineStyle('solid', 0.64, 'CHGRD')
        end
        featurePortrayal:AddInstructions('LineInstruction:_simple_')

    -- =====================
    -- CURVE
    -- =====================
    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:AddInstructions(
            'ViewingGroup:32410;DrawingPriority:12;DisplayPlane:UnderRADAR'
        )

        if contextParameters.PlainBoundaries then
            featurePortrayal:SimpleLineStyle('dash', 0.64, 'CHGRD')
        else
            featurePortrayal:SimpleLineStyle('solid', 0.64, 'CHGRD')
        end

        featurePortrayal:AddInstructions('LineInstruction:_simple_')

    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    return viewingGroup
end
