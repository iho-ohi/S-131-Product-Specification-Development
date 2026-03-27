-- Feature Catalogue Version: 2.0.0 (2025/10/25)
-- adapted for S131 by IIC

-- Pilot Boarding Place main entry point.
function PilotBoardingPlace(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		viewingGroup = 32400
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:32400;DrawingPriority:18;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32400;DrawingPriority:18;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:AddInstructions('PointInstruction:131SYMBL3S')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:3.51,3.51;FontSize:10')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'Plt %s'), 21, 24, 32400, 18)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
        viewingGroup = 32400
        featurePortrayal:AddInstructions(
            'ViewingGroup:32400;DrawingPriority:12;DisplayPlane:UnderRADAR'
        )
        featurePortrayal:AddInstructions('PointInstruction:131INFRM')
        featurePortrayal:SimpleLineStyle('dash', 0.64, 'CHGRD')
        featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
