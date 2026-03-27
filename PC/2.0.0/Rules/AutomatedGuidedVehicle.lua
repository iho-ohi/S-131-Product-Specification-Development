-- Feature Catalogue Version: 2.0.0
-- New rule developed for S131 by IIC

-- Automated Guided Vehicle main entry point.

function AutomatedGuidedVehicle(feature, featurePortrayal, contextParameters)
    local viewingGroup = 32400

    if feature.PrimitiveType == PrimitiveType.Surface then
        featurePortrayal:AddInstructions(
            'ViewingGroup:' .. viewingGroup ..
            ';DrawingPriority:6;DisplayPlane:UnderRADAR'
        )

        if contextParameters.PlainBoundaries then
            featurePortrayal:SimpleLineStyle('dash', 0.64, 'CHGRD')
        else
            featurePortrayal:SimpleLineStyle('solid', 0.64, 'CHGRD')
        end
        featurePortrayal:AddInstructions('PointInstruction:131INFRM')
        featurePortrayal:AddInstructions('LineInstruction:_simple_')

    elseif feature.PrimitiveType == PrimitiveType.Curve then
        featurePortrayal:AddInstructions(
            'ViewingGroup:' .. viewingGroup ..
            ';DrawingPriority:6;DisplayPlane:UnderRADAR'
        )
        featurePortrayal:SimpleLineStyle('dash', 0.64, 'CHGRD')
        featurePortrayal:AddInstructions('LineInstruction:_simple_')

    elseif feature.PrimitiveType == PrimitiveType.Point then
	featurePortrayal:AddInstructions(
            'ViewingGroup:' .. viewingGroup ..
            ';DrawingPriority:6;DisplayPlane:UnderRADAR'
        )
        featurePortrayal:AddInstructions('PointInstruction:131SYMBL3S')	
    else
        error('Invalid primitive type or mariner settings passed to portrayal')
    end

    return viewingGroup
end

