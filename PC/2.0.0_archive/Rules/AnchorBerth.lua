-- Feature Catalogue Version: 2.0.0 (2025/10/25)
-- Modified for S-131 2.0.0 by IIC 20250107

-- Anchor berth main entry point.
function AnchorBerth(feature, featurePortrayal, contextParameters)
	local viewingGroup

	if feature.PrimitiveType == PrimitiveType.Point then
		-- Simplified and paper chart points use the same symbolization
		viewingGroup = 32440
		if contextParameters.RadarOverlay then
			featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:15;DisplayPlane:OverRADAR')
		else
			featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:15;DisplayPlane:UnderRADAR')
		end
		featurePortrayal:AddInstructions('PointInstruction:131SYMBL3S')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:3.51,0;FontSize:10')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'Nr %s'), 29, 24, 32440, 15)
		end
	elseif feature.PrimitiveType == PrimitiveType.Surface then
		-- Plain and symbolized boundaries use the same symbolization
		viewingGroup = 32440
		featurePortrayal:AddInstructions('ViewingGroup:32440;DrawingPriority:15;DisplayPlane:UnderRADAR')
		featurePortrayal:AddInstructions('PointInstruction:131INFRM')
		if feature.featureName[1] and feature.featureName[1].name then
			featurePortrayal:AddInstructions('LocalOffset:3.51,0;FontSize:10')
			featurePortrayal:AddTextInstruction(EncodeString(GetFeatureName(feature, contextParameters), 'Nr %s'), 29, 24, 32440, 15)
		end
		featurePortrayal:SimpleLineStyle('dash',0.64,'CHGRD')
		featurePortrayal:AddInstructions('LineInstruction:_simple_')
	else
		error('Invalid primitive type or mariner settings passed to portrayal')
	end

	return viewingGroup
end
