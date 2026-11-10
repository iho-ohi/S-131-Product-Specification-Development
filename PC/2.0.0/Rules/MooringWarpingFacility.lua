-- Feature Catalogue Version: 2.0.0 (2025/10/25)
-- Modified for S-131 2.0.0 by IIC 20250107

-- Mooring/Warping facility main entry point.
function MooringWarpingFacility(feature, featurePortrayal, contextParameters)
    local viewingGroup = 32440
    local displayPlane = contextParameters.RadarOverlay and 'OverRADAR' or 'UnderRADAR'

    if feature.PrimitiveType == PrimitiveType.Point then
        featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:12;DisplayPlane:' .. displayPlane)
        featurePortrayal:AddInstructions('PointInstruction:131SYMBL3')

    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:12;DisplayPlane:' .. displayPlane)

        -- boundary portrayal must respect PlainBoundaries
        if contextParameters.PlainBoundaries then
            featurePortrayal:SimpleLineStyle('dash', 0.64, 'CHGRD')
        else
            featurePortrayal:SimpleLineStyle('solid', 0.64, 'CHGRD')
        end
        featurePortrayal:AddInstructions('LineInstruction:_simple_')

	elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:12;DisplayPlane:' .. displayPlane)

        -- boundary portrayal must respect PlainBoundaries
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

