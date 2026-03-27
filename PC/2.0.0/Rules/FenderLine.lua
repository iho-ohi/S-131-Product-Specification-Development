-- Feature Catalogue Version: 2.0.0
-- New rule developed for S131 by IIC

-- main entry point.

function FenderLine(feature, featurePortrayal, contextParameters)
    local viewingGroup = 32440

    if feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:AddInstructions(
            'ViewingGroup:' .. viewingGroup ..
            ';DrawingPriority:6;DisplayPlane:UnderRADAR'
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

