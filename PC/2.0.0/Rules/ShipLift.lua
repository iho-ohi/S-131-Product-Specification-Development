-- Feature Catalogue Version: 1.0.0 (2022/12/31)
-- Modified for S-131 2.0.0 by IIC 20250107

-- ShipLift main entry point.
function ShipLift(feature, featurePortrayal, contextParameters)
    local viewingGroup = 32400
    local displayPlane = contextParameters.RadarOverlay and 'OverRADAR' or 'UnderRADAR'

    -- =====================
    -- POINT
    -- =====================
    if feature.PrimitiveType == PrimitiveType.Point then
        featurePortrayal:AddInstructions(
            'ViewingGroup:32400;DrawingPriority:12;DisplayPlane:' .. displayPlane
        )
        featurePortrayal:AddInstructions('PointInstruction:131SYMBL3')

    -- =====================
    -- SURFACE
    -- =====================
    elseif feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:AddInstructions(
            'ViewingGroup:32400;DrawingPriority:12;DisplayPlane:' .. displayPlane
        )

        -- centroid symbol for ShipLift area (S-131 informational symbol)
        featurePortrayal:AddInstructions('PointInstruction:131INFRM')

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
